# Keyword: `ticks`

The `ticks` keyword represents the number of consecutive times an item has triggered an alert for a specific expression.

!!! warning

    Executing a plain `return` leaves an existing alert open but bypasses the `ticks` increment. If no alert is open at the time of a plain `return`, the internal `ticks` counter is reset to `0`.

This keyword is particularly useful for implementing escalating severities or delaying alerts, allowing you to react differently based on the persistence of an issue.

## Example: Escalating CPU Alert Severity
This example demonstrates how to increase the alert severity for high CPU usage over time.

```javascript
var.message = "CPU usage consistently too high" // Updated message for clarity

case item.cpu_usage > enodo.cpu_usage?.upper:
    // If CPU has been high for more than 10 consecutive checks
    case ticks > 10:
        return CRITICAL, var.message
    // If CPU has been high for more than 5 consecutive checks
    case ticks > 5:
        return ERROR, var.message
    // Initial alert for high CPU usage
    return WARNING, var.message

// Close the alert when CPU usage returns to normal
return OK
```

This setup ensures that minor, transient spikes might only generate a warning, while persistent high CPU usage will automatically escalate to higher severities, drawing more urgent attention.
