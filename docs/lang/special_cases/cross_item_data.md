# Cross-Item Data

InfraSonar expressions are evaluated for each individual item. However, there are scenarios where you need to reference the state or metrics of _other_ items within the same check result before deciding to raise an alert. InfraSonar exposes the full check result, allowing you to access data from other items.

The syntax for retrieving a specific metric from another item is:

```
result.<type-name>.get("<item-name>", "<metric-name>")
```

**Note:** If the `<type-name>` is optional, it might be `null` so in that case you should mark the type-name as optional with a question mark (`?`).

Consider a setup with two critical services, `"Primary"` and `"Secondary"`, each having a `Started` metric. You want to trigger an alert only if both services are not started.

```javascript
// Define a variable for the 'Started' metric of the "Secondary" service
// Use '?? false' to default to false if 'Secondary' service or 'Started'
// metric is not found
var.secondaryStarted = result.services.get("Secondary", "Started") ?? false

// This expression logic is designed to run only when evaluating
// the "Primary" service item.
// If the current item is not "Primary", we exit without action.
case item.name != "Primary":
    return

// If either the "Primary" service is Started OR the "Secondary" service
// is Started, then both are not down, so we return OK
// (close any existing alert).
case item.Started:
case var.secondaryStarted:
    return OK

// If neither of the above conditions are met, it means:
// 1. The current item IS "Primary".
// 2. "Primary".Started is false.
// 3. "Secondary".Started (var.secondaryStarted) is false.
// Therefore, both services are down.
return ERROR, "Both the primary and secondary service are down"
```

This powerful feature allows you to define complex cross-item alert conditions within a single expression.
