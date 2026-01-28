# Global state (`get` and `set`)

By default, an expression only knows about the current item it is evaluating. The `get` and `set` functions allow you to share data across different items by storing values in a temporary "global state" during the check.

This is most commonly used to find inconsistencies _(like version mismatches)_ or to aggregate totals _(like summing CPU across a cluster)_.

## Function Syntax

Function | Description | Syntax
-------- | ----------- | ------
`get`    | Retrieves a value from the state. | `get('key', default_value)`
`set`    | Saves a value to the state.       | `set('key', value)`

!!! info
    Note: `get` always requires a second argument as a **default value**. This value is used if the key hasn't been set yet (usually during the evaluation of the first item).


## Example: Detecting Version Mismatch

In this scenario, we want to ensure all servers in a group are running the same software version. We "lock in" the version of the first server we see and compare every subsequent server against it.

```javascript
// 1. Define the alert message
var.message = "
Version mismatch detected!
Reference: @var.name (v@var.version)
Conflict:  @item.name (v@item.version)
"

// 2. Try to get the reference data from previous items
var.name = get('ref_name', '')
var.version = get('ref_version', '')

// 3. Initialization: If name is empty, this is the FIRST item in the check.
case var.name == '':
    set('ref_name', item.name)
    set('ref_version', item.version)
    return OK

// 4. Comparison: Compare current item to the reference stored in state
case item.version != var.version:
    return ERROR, var.message

return OK
```

## Best Practices

When using `get` and `set` to compare items, you should enable the **"Single Alert"** option in your check configuration.

- **Without it:** You might get multiple separate alerts if several items fail the comparison.
- **With it:** InfraSonar groups the results into a single consolidated notification.

!!! info "Single Alert"
    A **Single Alert** auto-closes if the entire result is empty _(no items)_, or if at least one expression returns `OK` while no other items trigger an alert.

## Persistence Lifecycle

Values stored with `set` only persist for the duration of a single check run. Once the check completes and the final item is evaluated, the state is cleared. It will not interfere with the next time the check runs.

## Advanced Aggregation

If you need to collect a list of all items that don't match, rather than just alerting on the first one found, see the [append() function documentation](../functions/append.md).