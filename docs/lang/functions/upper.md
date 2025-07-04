# Function: `upper`

The `upper()` function converts all lowercase characters in a string to their uppercase equivalents. It can be called on a single string or on a list of strings.

- When called on a **string**, it returns a new string with all characters converted to uppercase.
- When called on a **list of strings**, it returns a new list where each string element has been converted to uppercase.

## Syntax:
```
<string>.upper()
<list_of_strings>.upper()
```

## Example 1: Single String
```javascript
var.test_string = "Hello World!"
var.upper_case_string = var.test_string.upper()

case true:
    // Render as: "Lower case string: HELLO WORLD!"
    return DEBUG, "Lower case string: @var.upper_case_string"
```

## Example 2: List of Strings
```javascript
var.test_list = ["Apple", "banana", "Cherry"]
var.upper_case_list = var.test_list.upper()

// Check if "APPLE" is present in the new uppercase list
case "APPLE" in var.upper_case_list:
    return DEBUG, "Yes, 'APPLE' is in the list!"
```