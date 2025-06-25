# Function: `diff`

The `diff()` function calculates the absolute difference between the current value of a numeric metric and its value from the previous check. It is typically used for counter-type metrics that continuously increase.

The function can be applied to both `float` and `integer` metrics, returning a value of the same type.

!!! Note "Dependency"
    The `diff()` function requires a previous value for the metric to compute the difference. Therefore this expression will only start if a previous value is available.

## Syntax:
```
<numeric_metric>.diff()
```

## Example:
```javascript
// Calculate the number of new errors since the last check
var.new_errors = item.error_count.diff()

case var.new_errors > 0:
    return WARNING, "Errors detected since last check: @var.new_errors"
```
