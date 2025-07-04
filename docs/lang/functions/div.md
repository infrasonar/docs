# Function: `div`

The `div()` function performs floating-point division, dividing one number by another. It always returns a `float` value, even if both operands are integers.

If you require floor division, use the [fdiv()](../fdiv) function instead.

## Syntax:
```
<numerator>.div(<denominator>)
```

!!! tip "Division by Zero"
    If the denominator is `0`, the `div()` function will result in an error. You should handle this case using the [nullish coalescing operator](../../basics/variables_in_expression#preventing-errors-and-null-values) (`??`) to provide a default value or specific case logic to avoid runtime errors.

This example calculates an error rate by dividing the `error_count` by the metric `time_span`.

## Example:
```javascript
// Calculate the error rate by a second metric providing the time span
var.error_rate = item.error_count.div(item.time_span)

case var.error_rate > 0.1:
    return WARNING, "Error rate is high: @var.error_rate"

case var.error_rate > 0:
    return NOTICE, "Errors detected at a rate of: @var.error_rate"

// Implicitly returns OK if error_rate is 0
return OK
```
