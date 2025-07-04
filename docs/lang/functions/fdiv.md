# Function: `fdiv`

The `fdiv()` function performs floor division _(also known as integer division)_, which divides one number by another and then rounds the result down to the nearest whole number.

- If both the numerator and denominator are integers, the function returns an `integer`.
- If either the numerator or denominator is a float, the function returns a `float`.


## Syntax:
```
<numerator>.fdiv(<denominator>)
```

!!! tip "Division by Zero"
    If the denominator is `0`, the `fdiv()` function will result in an error. You should handle this case using the [nullish coalescing operator](../../basics/variables_in_expression#preventing-errors-and-null-values) (`??`) to provide a default value or specific case logic to avoid runtime errors.

This example uses `fdiv()` to check if an HTTP status code falls outside the 2xx range (success codes).

## Example:
```javascript
// Perform floor division: e.g., 200 fdiv 100 = 2, 301 fdiv 100 = 3
case item.statusCode.fdiv(100) != 2:
    return WARNING, "HTTP Status Code outside 2xx range: @var.status_code"

// If the status code is 2xx, return OK to clear or prevent an alert.
return OK
```
