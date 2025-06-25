![Conditions](../images/concept_conditions.png){ width="150" align=right}

# :material-list-status: Conditions

Check results sent to the InfraSonar cloud platform are immediately evaluated using the conditions configured for the specific asset.

InfraSonar comes with many predefined conditions based on years of experience and best practices.

In order to manage conditions you need to have the ContainerAdmin role on the container you want to manage conditions for.

### General tab

**Name**

The name you want to use for your condition, we suggest a short descriptive name.

**Description**

use the description to provide a short description of the purpose and usage of the condition.

**Collector**

Select the path to the data you want this condition.

For collectors this is: `Collector`, `Check`, `Type`

**Condition kind**

We identify three kind of Conditions:

**Kind**         | **Description**
-----------------|------------------------------
EXPRESSION       | Enter an expression to run against each existing item of the selected type in the result. The `item` variable represents the item and `prev` refers to the previously known item.
ITEMS MUST EXIST | Enter an expression to run against each existing item of the selected type in the result. The `item` variable represents the item and `prev` refers to the previously known item.
ITEMS_MISSING    | Enter an expression to run against each item of the selected type that is missing from the result compared to the previous result. The `item` variable in the expression represents the previously known item.

**Ticks**

The number of times this condition must be hit in a row before an actual alert will be raised.

!!! note
    Ticks can not be set for the condition kind `ITEMS_MISSING` as this compares with a previous check result.

**Single alert**

Gathers up all alerts into a single alert per asset. When disabled, each item will be tested and may raise an alert.

**Close on return**

Close the alert when a missing item returns. This option is only available for an `ITEM_MISSING` condition and cannot be enabled in combination with **"Single alert"**.

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

All items will be compared towards the previous items. If one (or more) items is missing which is not excluded by either the item list or regular expression, the condition expression will start and will return with an alert based on the expression outcome.

- Will re-run when added to an asset or when the condition has changed.

### Expression tab

InfraSonar uses a powerful expression language that allows for precise and tailored conditions.

See our [exxpression language documentation](../../lang) to learn how to write InfraSonar condition expressions.

