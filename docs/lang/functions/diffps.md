# Function: `diffps`

The `diffps()` function calculates the rate of change per second of a numeric metric between its current value and its value from the previous check. It is specifically designed for counter-type metrics that continuously increase, providing an interval-independent measure of activity.

he function can be applied to both `float` and `integer` metrics. The returned value will be a `float`, as it represents a rate over time.

!!! Note "Dependency"
    The `diffps()` function requires a previous value for the metric to compute the difference. Therefore this expression will only start if a previous value is available.

## Syntax:
```
<numeric_metric>.diffps()
```

## Example:
```javascript
// Calculate the number of new errors per second since the last check
var.error_rate_per_second = item.error_count.diffps()

case var.error_rate_per_second > 0.0:
    return WARNING, "Errors detected at rate: @var.error_rate_per_second /s"
```


