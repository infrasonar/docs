![Conditions](../images/concept_conditions.png){ width="150" align=right}

# :material-list-status: Conditions

:construction: Under construction :construction:

Check results sent to the InfraSonar cloud platform are immediately evaluated using the conditions configured for the specific asset. 

InfraSonar comes with many predefined conditions based on years of experience and best practices.

In order to manage conditions you need to have the ContainerAdmin role on the container you want to manage conditions for.


## Managing conditions

While our condition editor might feel intimidating at first glance, it is potent. We urge you to look at our predefined conditions for inspiration and a deeper understanding.

* :green_circle:
* :material-pencil:
* :material-link:
* :fontawesome-solid-trash:

### General tab

**Name** 

The name you want to use for your condition, we suggest a short descriptive name.

**Description**

use the description to provide a short description of the purpose and usage of the condition.

**Collector**

Select the path to the data you want this condition.

For probes this is: `Collector`, `Check`, `Type`

**Condition kind**

We identify three kind of Conditions:

**Kind**         | **Description**
-----------------|------------------------------
EXPRESSION       | Detailed expression used to evaluate the check result.
ITEMS MUST EXIST | Used to detect **items** which must exist.
ITEMS_MISSING    | Used to detect **items** missing compared to the previous check result.

**Ticks**

The number of times this condition must be hit in a row before an actual alert will be raised.

!!! note
    Ticks can not be set for the condition kind `ITEMS_MISSING` as this compares with a previous check result.

**Single alert** 

Gathers up all alerts into a single alert per asset. When disabled, each item will be tested and may raise an alert.

### Labels tab

In this tab you configure for which labels the condition is active.

### Items tab

This tab allows you to set the severity and specify for which items this conditions is a active in case of `ITEMS MUST EXIST` or which items this condition should exclude in the case of `ITEMS_MISSING`

#### Items must exist

All items will be checked for existence by the given list or regular expression. 

- Condition will be executed when added to an asset or when the condition has been changed.
- Auto-close is always enabled.
- The item list or regular expression work as "_include_" by the _item.name_ property.
  - When a list is used, all items in the list must exist otherwise the condition is hit.
  - When a regular expression is used, at least one item must match with the given regular expression otherwise the condition is hit.

#### Items missing

All items will be compared towards the previous items. If one (or more) items is missing which is not excluded by either the item list or regular expression, the condition is hit.

- Will re-run when added to an asset or when the condition has changed.
- Open alerts will never _auto-close_. Note that they can be closed _indirectly_, for example when the condition or check is removed from an asset.
- The item list or regular expression work as "_exclude_" by the _item.name_ property.
  - When a list is used, the items in the list will be ignored when missing.
  - When a regular expression is used, an item match will ignore the item when missing.



enodo.metric.upper lower value (+aggregation mix)



### Expression tab

InfraSonar uses a powerful expression language that allows for precise and tailored conditions.

Each item is processed by the given expression. If `new` is used in the expression, it is best practice not to use `return OK` in the expression as auto close does not make sense. This is because an item will only be _new_ once.
- Condition will be executed when added to an asset or when the condition has been changed, unless `prev` (previous item) is used in the expression. When `prev` is used, only when new data is received the condition will evaluate again.
- `return OK`  -> Success, Auto-close open alert if there is one.
- `return` -> Success, Do not auto-close an open alert if there was one.
- `return ERROR, "..."` -> return with severity and optional message. (ERROR might be INFO, CRITICAL etc.)


Example expression

```python
// alert message template
var.template = "
Certificate almost expires!
name: @item.name
expires in: @item.expiresIn seconds
"

case item.expiresIn < 604_800:  
    // Certificate will expire in less than 7 days
    return WARNING, var.template

case item.expiresIn < 1_209_600:  
    // Certificate will expire in less than 14 days
    return NOTICE, var.template

case "organisationName=Let's Encrypt" in item.issuer:
    // Skip less than 28 days for Let's Encrypt certificates
    return OK 

case item.expiresIn < 2_419_200:  
    // Certificate will expire in less than 28 days
    return INFORMATIONAL, var.template

// this add's autoclose
return OK
```


#### case statement

The `case` statement is


`case new`


#### return statement

`return <severity>, <message>`

The return statement is used to return the severity and a message.

`return` without any parameters is also possible.

`severity` 

Severity [^1] | Description
--------------|------------------------------------------------------------------------
EMERGENCY     | System is unusable.                                                    
ALERT         | Action must be taken immediately.                                      
CRITICAL      | Critical conditions.                                                   
ERROR         | Error conditions.                                                      
WARNING       | Warning conditions.                                                    
NOTICE        | Normal but significant conditions.                                     
INFORMATIONAL | Informational.                                                         
DEBUG         | Messages that contain information normally of use only when debugging. 
OK            | This is an explicit OK which results in an alert auto closing when hit.

[^1]: Our severity levels are derived from the Syslog levels, see this [Syslog :material-wikipedia: wikipedia article](https://en.wikipedia.org/wiki/Syslog) for additional information.

!!! note "Severity usage"

    InfraSonar pre-defined conditions only the severity levels  `CRITICAL`, `ERROR`, `WARNING` & `NOTICE`.

    We advice to use `ALERT` & `EMERGENCY` for your specific use cases;
    `EMERGENCY` could for example be used to send notifications to a 24x7 team as voice message using our [rules](./rules.md) and where `ALERT` is used to send to a WhatsApp message.

`message`

The message can be a string message including variable substitution.
E.g. `My @item.name`





