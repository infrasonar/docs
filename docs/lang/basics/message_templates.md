# Message Templates
You can embed dynamic values within your alert messages using message templates. These templates allow you to include relevant data, such as an item's name or metric values, directly in the alert.

```javascript
return DEBUG, "Memory usage of @item.name to high"
```

In this example, `@item.name` acts as a placeholder that will be replaced with the actual name of the item when the message is generated.

## Escaping the `@` Symbol
If you need to include a literal `@` sign in your message that shouldn't be interpreted as the start of a variable, add an exclamation mark (`!`) immediately after it:

```javascript
return DEBUG, "Use @! in message."  // Renders as: "Use @ in message."
```

## Escaping the single and double quotes
It is possible to use single quotes in a double quote string, but sometimes you just want a double quote in a double quote string. In this case, you need to write two of them

```javascript
return DEBUG, "Use ""Double quotes"" in a double quote string."
// Renders as: Use "Double quotes" in a double quote string.
```

## Explicitly Ending a Variable Placeholder
Sometimes, characters immediately following a variable placeholder (like a period) can cause ambiguity. The system might incorrectly try to include that character as part of the variable name, leading to a template error.

```javascript
return DEBUG, "Failed item: @item.name."
```

This would produce an error similar to:

```
template error: ambiguous `.` after `@item.name`; maybe you want to print the dot? use: @item.name!.
```

To resolve this, explicitly mark the end of the variable placeholder with an exclamation mark (`!`) before the punctuation:

```javascript
return DEBUG, "Failed item: @item.name!."  // Renders as: "Failed item: my-item."
```

Notice that the `!` used to terminate the variable does not appear in the final message.

## Including a Literal Exclamation Mark After a Variable
If you genuinely want an exclamation mark to appear after a variable in your message, simply add two exclamation marks:

```javascript
return DEBUG, "Failed item: @item.name!!"  // Renders as: "Failed item: my-item!"
```

## Accessing Previous Item Values
You can reference values from the previous evaluation cycle using the pr`ev keyword. This is useful for comparing current and historical data:

```javascript
return DEBUG, "Memory usage: @item.usage_memory (Previous: @prev.usage_memory)"
// Example output: "Memory usage: 76853248, Previous value: 63619072"
```

## Formatted Values with `fmt.`
Raw metric values (like `76853248`) might not be user-friendly. For better readability, use the `fmt.` prefix to display formatted values (e.g., human-readable sizes, percentages):

```javascript
return DEBUG, "Memory usage: @fmt.item.usage_memory"
// Example output: "Memory usage: 73.29 MiB"
```

## Multiline Messages
Messages are multiline by default. You can define them across multiple lines using a multiline string:

```javascript
var.message = "
Memory usage: @fmt.item.usage_memory
Previous value: @fmt.prev.usage_memory
"
```

Note: Any leading or trailing whitespace _(like the newline character at the start and end of the example above)_ will be automatically trimmed from the rendered message.

## Listing All Items in a Message
You can iterate through and list all items directly within a message template. This is particularly useful when you want a single alert to provide a comprehensive overview of multiple items, rather than generating separate alerts for each.

It is even possible to list all items in a message. This can be especially useful if you want a single alert, but the message to contain all item.

```javascript
var.message = "
All items:

#for @pod in @items:
- @pod.name : @pod.status
#end
"

case item.status != "Running":
    return DEBUG, var.message
```

When this alert is triggered, the `var.message` template will render a detailed list of items. For example, the output might look like this:

```
All items:

- forecast-0 : Running
- forecast-1 : Stopped
- hub-0 : Running
- hub-1 : Running
- hub-2 : Running
- hub-3 : Stopped
- notifications-0 : Running
- notifications-1 : Running
```

## Available Message Placeholders
This table provides an overview of the most commonly used placeholders and their respective examples and descriptions.

Placeholder                         | Example output               | Description
----------------------------        | ---------------------------- | ------------
`@asset.id`                         | `34567`                      | The unique identifier for the asset.
`@asset.name`                       | `myhost.local`               | The name of the asset.
`@asset.string.<key>`               | `...`                        | The asset property `<key>` containing a string value.
`@asset.strings.<key>`              | `[..., ...]`                 | The asset property `<key>` containing a list of string values.
`@asset.number.<key>`              | `[..., ...]`                 | The asset property `<key>` containing a list of string values.
`@check.duration`                   | `4.05123`                    | The duration of the current check in seconds (float).
`@check.interval`                   | `300`                        | The configured check interval in seconds (integer).
`@check.local_datetime`             | `2022-07-21 16:45:44+02:00`  | The timezone-aware local date and time of the current check result.
`@check.prev.local_datetime`        | `2022-07-21 16:40:43+02:00`  | The timezone-aware local date and time of the previous check result.
`@check.prev.timestamp`             | `1658253617`                 | The Unix timestamp of the previous check result.
`@check.prev.utc_datetime`          | `2022-07-21 14:40:44+00:00`  | The UTC date and time of the previous check result.
`@check.timestamp`                  | `1658253918`                 | The Unix timestamp of the current check result.
`@check.utc_datetime`               | `2022-07-21 14:45:44+00:00`  | The UTC date and time of the current check result.
`@container.id`                     | `12345`                      | The unique identifier for the container.
`@container.name`                   | `Cesbit`                     | The name of the container.
`@enodo.<metric>.diffps.upper`      | `0.01234`                    | The raw forecasted upper bound value, compared to the previous value per second.
`@enodo.<metric>.upper`             | `0.1234`                     | The raw forecasted upper bound value from Enodo.
`@fmt.enodo.<metric>.lower`         | `99%`                        | The formatted forecasted lower bound value from Enodo.
`@fmt.item.<metric>`                | `123 MB`                     | The formatted value of the current item's metric (e.g., human-readable).
`@fmt.other.<metric>`               | `99%`                        | The formatted value of another item's metric.
`@fmt.prev.<metric>`                | `99%`                        | The formatted value of the item's metric from the previous check.
`@hit`                              | `0`                          | The number of items currently triggering an alert (0 or more).
`@hour`                             | `0`                          | The current hour (0-23).
`@item.<metric>`                    | `cpu1`                       | The raw value of the current item's metric.
`@minute`                           | `0`                          | The current minute (0-59).
`@new`                              | `True`                       | `True` if the item is newly detected, `False` otherwise.
`@other.<metric>`                   | `99.14525`                   | The raw value of a metric from another item.
`@prev.<metric>`                    | `99.14525`                   | The raw value of the item's metric from the previous check result.
`@ticks`                            | `0`                          | The total number of times this specific alert has been triggered previously (0 or more).
`@var.variable`                     | `...`                        | The value of a user-defined variable (see [Variables in Expressions](../variables_in_expression)).
`@weekday`                          | `Monday`                     | The current day of the week (e.g., Monday, Tuesday).
`#for @x in @items: ...#end`        | `...`                        | Loops through all items (using raw values) (see [Listing All Items in a Message](#listing-all-items-in-a-message)).
`#for @x in @fmt.items: ... #end`   | `...`                        | Loops through all items, using formatted values within the loop (see [Listing All Items in a Message](#listing-all-items-in-a-message)).
