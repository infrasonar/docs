# Function: `endswith`

The `endswith()` function checks if a string ends with a specified substring. It returns `true` if the string ends with the given substring, and `false` otherwise. This comparison is case-sensitive.

For case-insensitive matching, you can combine `endswith()` with the [lower()](../lower) or [upper()](../upper) functions.

## Syntax:
```
<string>.endswith(<string>)
```

## Example:
```javascript
var.file_name = "report.csv"

case var.file_name.upper().endswith(".CSV"):
    return DEBUG, "File is a CSV: @var.file_name"
```
