# Compare with Another Item (`other` keyword)

InfraSonar allows you to compare the current item's metrics against metrics of another item within the same check result using the `other` keyword. This is particularly useful for scenarios where you need to verify consistency across multiple instances of a service or application _(e.g., ensuring all instances run the same version)_.

This feature is often used in conjunction with the **"Single Alert"** option to consolidate notifications when an inconsistency is found among multiple items.

```javascript
var.message = "
Version mismatch: @item.name (v@item.version) vs. @other.name (v@other.version)
"

// Example: Alert if item's version does not match 'other' item's version
case item.version != other.version:
    return ERROR, var.message
return OK
```

## How `other` Works:
When an expression uses the `other` keyword, InfraSonar internally manages its evaluation to enable cross-item comparisons:

1. **Selection of other**: For each evaluation cycle, InfraSonar selects one item from the current check result to be designated as other.
2. **Iterative Comparison**: The expression is then executed for every other item in the check result, where item refers to the current item being evaluated, and other refers to the pre-selected item from step 1.
3. **Single Item Edge Case**: If there is only one item present in the check result, `other` will be assigned the same item as `item`. In this specific scenario, `item.metric == other.metric` will always evaluate to `true`, ensuring that the condition will be able to automatically close any previous alert which can happen when items are removed. This prevents unnecessary alerts when only one instance exists.

By using `other`, you can detect inconsistencies across your monitored items effectively.