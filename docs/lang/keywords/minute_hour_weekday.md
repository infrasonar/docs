# Keywords: `minute`, `hour`, `weekday`

InfraSonar provides dedicated keywords to make your alert expressions time-dependent. This is highly valuable for controlling when alerts are active.

## Keyword Definitions:
- `minute`: A numeric (integer) value representing the current minute, ranging from `0` to `59`.
- `hour`: A numeric (integer) value representing the current hour (in 24-hour format), ranging from `0` to `23`.
- `weekday`: A string value representing the current day of the week (e.g., `"Monday"`, `"Tuesday"`, ..., `"Sunday"`).

It is important to note that for all time-dependent keywords (`minute`, `hour`, `weekday`), the **timezone of the container running the expression** is used.

## Example: Time-Based Alert Suppression

This example demonstrates how to suppress alerts for new errors outside of typical business hours (Monday-Friday, 8:00 AM - 5:30 PM).

```javascript
case weekday in ['Saturday', 'Sunday']:
    return // Suppress all alerts on weekends

case hour < 8:
    return // Suppress all alerts before 8 AM

case hour > 17:
    case minute > 30:
        return // Suppress all alerts after 5:30 PM (17:30)

// If none of the above conditions are met
case item.error_count.diff() > 0:
    return WARNING, "Error(s) found on item: @item.name"
```

This setup allows for precise control over when alerts are active, reducing noise during non-operational hours.