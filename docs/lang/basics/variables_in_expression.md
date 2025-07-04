# Variables in Expression

You can define variables within your expression to reuse values multiple times. This improves readability and maintainability, especially for complex calculations.

Variables must be assigned **before** any `case` statements. This ensures they are properly defined and available for use in your expression.

```javascript
// Define "var.ratio"
var.ratio = item.usage_memory?.div(item.allocatable_memory)

case var.ratio? > 0.9:
    return CRITICAL, "Memory usage way too high!"
case var.ratio? > 0.8:
    return WARNING, "Hign memory usage"
```

## Handling Optional Metrics (Null Values)

When a variable's value is derived from an optional metric (which might be `null`), the variable itself can also be `null`. To correctly handle this in your expressions, you should mark the variable as optional with a `?`.

For example, `item.usage_memory` might be `null`. In such cases, `var.ratio` would also be `null`, requiring `var.ratio?` in the `case` statements.

## Preventing Errors and Null values

Expressions can encounter issues like division by zero or other errors if source metrics are missing or invalid _(e.g., `item.allocatable_memory` is `0`)_. To gracefully handle such scenarios, you can use the nullish coalescing operator `??`.

The `??` operator assigns the value on its right if the expression on its left evaluates to `null` or an error.

```javascript
// Define "var.ratio"
var.ratio = item.usage_memory?.div(item.allocatable_memory) ?? 0

case var.ratio > 0.9:
    return CRITICAL, "Memory usage way too high!"
case var.ratio > 0.8:
    return WARNING, "Hign memory usage"
```

In this example, if `item.usage_memory?.div(item.allocatable_memory)` results in `null` or an error (like zero division), `var.ratio` will be assigned `0` instead. This provides robust error handling.

## Chaining Optional Metrics with `??`

If multiple metrics involved in a calculation are optional, you can strategically use `??` to ensure valid types for operations.

Suppose `item.allocatable_memory` is also optional:
```javascript
var.ratio = item.usage_memory?.div(item.allocatable_memory?)
// This would cause a type error:
//   function div(..) with argument type NullableInt
```

Directly passing `item.allocatable_memory?` _(which can be NullableInt)_ to `div()` results in an error as `div()` expects a non-null number.

To solve this, use `??` to provide a default non-null value for optional metrics before using them in calculations:

```javascript
var.allocatable_memory = item.allocatable_memory? ?? 0
var.ratio = item.usage_memory?.div(var.allocatable_memory) ?? 0
```

By assigning `item.allocatable_memory? ?? 0` to `var.allocatable_memory`, we ensure that `var.allocatable_memory` is always a non-null integer _(either the actual value or 0)_. This allows InfraSonar to perform type validation successfully.

