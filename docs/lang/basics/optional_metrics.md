# Optional Metrics

In InfraSonar, you may encounter metrics with a question mark (`?`) appended to their name (e.g., `item.some_metric?`). This visual cue indicates that the metric is optional and its value can potentially be `null`. Unlike regular metrics which are guaranteed to always have a value, optional metrics might not always be present or valid in the incoming data.

When working with such metrics in your expressions, InfraSonar requires you to explicitly mark them with a question mark (e.g., `item.payload?`). While the question mark itself doesn't change how InfraSonar evaluates the expression at runtime, its presence generates awareness. It visually reminds you that the value might be `null`, prompting you to handle this possibility in your logic.

Consider the following expression, which might be used with data from the `http` or `httpsvc` collector:

```javascript
// Test if the payload contains the word "ERROR"
case "ERROR" in item.payload.upper():
    return ERROR, "Payload contains an error"
```

If the `payload` metric is optional and you omit the question mark, InfraSonar will prevent you from saving the expression, displaying a clear message like this:

```
metric `payload` is nullable and must be marked with a question mark like `item.payload?
```

To correctly handle the optional `payload` and allow the expression to be saved, you must include the question mark:

```javascript
case "ERROR" in item.payload?.upper():
    return ERROR, "Payload contains an error"
```

It's crucial to understand how InfraSonar expressions behave when an optional metric (marked with `?`) is actually `null`.

When an optional metric like `item.payload?` is `null`, any attempt to access its properties or call its methods (like `item.payload?.upper()`) will automatically cause that specific part of the expression to evaluate as `false`. The operation on the `null` value is simply skipped, and the overall condition will not be met.

In essence, if a nullable metric is `null`, any operation on it _(unless it's an explicit `null` check)_ will result in `false`.

 If you want to explicitly detect and act upon a missing or `null` metric, you must test for `null` directly:

```javascript
case item.payload? == null:
    return ERROR, "Payload is missing"
```

This ensures you have full control over how your expressions respond to the absence of data, allowing you to differentiate between a metric being present but not matching a condition, and a metric being entirely `null`.
