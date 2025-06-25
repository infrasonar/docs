# Function: `startswith`

The `startswith()` function checks if a string begins with a specified substring. It returns `true` if the string starts with the given substring, and `false` otherwise. This comparison is case-sensitive.

For case-insensitive matching, you can combine `startswith()` with the [lower()](../lower) or [upper()](../upper) functions.

## Syntax:
```
<string>.startswith(<string>)
```

## Example:
```javascript
var.log_message = "Error: Connection refused."

case var.log_message.lower().startswith("error"):
    return DEBUG, "Log message indicates an error."
```
