# Function: `mod`

The `mod()` function performs the modulo operation _(remainder after division)_. This is useful for tasks like checking divisibility, cyclical behavior, or ensuring a value stays within a certain range.

- If both numbers are integers, the result will be an integer.
- If either number is a float, the result will be a float.

## Syntax:
```
<operand>.mod(<modulus>)
```

!!! tip "Modulo by Zero"
    If the modulus is `0`, the `mod()` function will result in an error. You should handle this case using the [nullish coalescing operator](../../basics/variables_in_expression#preventing-errors-and-null-values) (`??`) to provide a default value or specific case logic to avoid runtime errors.

## Example:
```javascript
var.my_number = 15

// Check if the number is odd (remainder is 1 when divided by 2)
case var.my_number.mod(2) == 1:
    return DEBUG, "My number (@var.my_number) is odd."

// Check if the number is even (remainder is 0 when divided by 2)
case var.my_number.mod(2) == 0:
    return DEBUG, "My number (@var.my_number) is even."
```
