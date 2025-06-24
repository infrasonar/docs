# Using AND/OR logic

InfraSonar's expression language allows you to combine multiple `case` statements using both AND logic _(through nesting)_ and OR logic _(through sequential `case` statements)_. This flexibility helps you define highly specific alert triggers.

## AND Logic

When you nest `case` statements, they form an AND relationship. The inner `case` will only be evaluated if all preceding outer `case` conditions are met.

Suppose you want to raise an alert _only_ when memory usage exceeds 80% AND the operating system is neither "Windows" nor "ChromeOS". You could achieve this by nesting:

```javascript
// Raise a WARNING if memory usage > 80%
// AND the OS is NOT Windows
// AND the OS is NOT ChromeOS
case item.memory_usage_ratio > 0.8:
    case item.os != "Windows":
        case item.os != "ChromeOS":
            return WARNING, "Memory usage of @item.name exceeds 80%"
return OK
```

While functional, this nested approach can become less readable as more conditions are added, especially for exclusion logic.

## OR Logic

A more elegant and readable way to handle exclusions or multiple conditions that lead to the same outcome is to use sequential `case` statements, which act as OR conditions. The first `case` statement that evaluates to true will be executed.

To achieve the same goal (alert when memory usage > 80%, but _not_ for Windows or ChromeOS), we can place an early `return` statement for the excluded operating systems.

```javascript
case item.os == "Windows":
case item.os == "ChromeOS":
    return // Exclude when "os" is Windows OR ChromeOS

// Test if memory usage exceeds 80 percent
case item.memory_usage_ratio > 0.8:
    return WARNING, "Memory usage of @item.name exceeds 80%"
return OK
```

This method improves readability and maintainability, especially when dealing with more complex exclusion criteria.
