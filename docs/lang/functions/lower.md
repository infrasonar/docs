# Function: `lower`

The `lower()` function converts all uppercase characters in a string to their lowercase equivalents. It can be called on a single string or on a list of strings.

- When called on a **string**, it returns a new string with all characters converted to lowercase.
- When called on a **list of strings**, it returns a new list where each string element has been converted to lowercase.

## Syntax:
```
<string>.lower()
<list_of_strings>.lower()
```

## Example 1: Single String
```javascript
var.test_string = "Hello World!"
var.lower_case_string = var.test_string.lower()

case true:
    // Render as: "Lower case string: hello world!"
    return DEBUG, "Lower case string: @var.lower_case_string"
```

## Example 2: List of Strings
```javascript
var.test_list = ["Apple", "BANANA", "Cherry"]
var.lower_case_list = var.test_list.lower()

// Check if "banana" is present in the new lowercase list
case "banana" in var.lower_case_list:
    return DEBUG, "Yes, 'banana' is in the list!"
```