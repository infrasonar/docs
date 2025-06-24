# Keyword: `hit`

The `hit` keyword provides the count of items that are currently triggering an alert within the scope of the current check and expression. This allows you to create alerts that respond to the number of affected items, rather than just individual item states.

The value of `hit` ranges from `0` to the total number of items being evaluated with an alert as result.

## Example: Limiting Alert Volume

Consider a scenario where you want to be notified about errors, but prevent alert storms for widespread, minor issues.

```javascript
case hit > 5:
    return OK // Suppress alerts if more than 5 interfaces are hitting the error condition

case item.errors == 0:
    return OK // Close alerts for interfaces with no errors

return NOTICE, "Errors detected on interface: @item.name"
```

This example effectively creates alerts for a maximum of five interfaces. Alerts for individual interfaces will automatically close when their errors resolve.
