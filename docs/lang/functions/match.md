# Function: `match`

The `match()` function evaluates whether a string matches a specified regular expression at the beginning of a string. It returns `true` if any part of the string matches the pattern, and `false` otherwise.

!!! note "Regular expressions"
    Regular expressions provide powerful pattern matching capabilities. It's crucial to understand basic regex syntax when using this function. If you need to search for a pattern _anywhere_ within a string, you must explicitly anchor your regular expression pattern to allow for characters at the beginning (e.g., using `.*`).

For case-insensitive matching, use the [imatch()](../imatch) function instead.

## Syntax:
```
<string>.match(<regular_expression>)
```

## Example:
```javascript
var.test_message = "5262 - Test message"

case var.test_message.match("\d+"):
    return DEBUG, "Starts with a number."
```
