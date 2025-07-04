# Function: `imatch`

The `imatch()` function evaluates whether a string matches a specified regular expression at the beginning of a string. It returns `true` if any part of the string matches the pattern, and `false` otherwise. The match will be case in-sensitive.

!!! note "Regular expressions"
    Regular expressions provide powerful pattern matching capabilities. It's crucial to understand basic regex syntax when using this function. If you need to search for a pattern _anywhere_ within a string, you must explicitly anchor your regular expression pattern to allow for characters at the beginning (e.g., using `.*`).

For case-sensitive matching, use the [match()](../match) function instead.

## Syntax:
```
<string>.imatch(<regular_expression>)
```

## Example:
```javascript
var.log_entry = "System Error[53]: Disk full."

// Test if error[X] is found, case in-sensitive
case var.log_entry.imatch(".*error\[\d+\]"):
    return WARNING, "Error found: @var.log_entry"
```
