# Prevent Immediate Close
"Flapping" occurs when a value hovers right on the edge of a threshold, causing an alert to open and close repeatedly. You can prevent this by requiring the alert to stay active for a minimum number of "ticks" (evaluation cycles) or a specific duration of time before it is allowed to close.

## Method 1: Minimum Evaluation Ticks
This approach ensures the alert remains open for at least one extra cycle after the condition has been resolved. This is useful for smoothing out momentary "blips."

```javascript
// Check if the condition is currently failing
case item.state != 'running':
    return ERROR, "Item state is @item.state"

case ticks < 2:
    // Hysteresis: Prevents immediate closure by echoing the previous state.
    // If the alert was already OK, returning last_severity (OK) effectively
    // acts as a standard 'return OK', allowing the check to resolve normally
    // This is required to increate the number of ticks if an alert is open.
    return alert.last_severity, "@alert.last_message"

// If the condition is OK and we have met the tick requirement, resolve.
return OK
```

## Method 2: Minimum Time Duration
This approach is better for checks with an unpredictable check interval. It prevents the alert from closing until a specific amount of time has passed since it first triggered.

```javascript
// Calculate alert age.
// Using 'created' ensures a minimum total lifespan for the alert.
// Alternatively, use 'last_hit' to require a cooldown period starting
// from the most recent failure.
var.duration = now.sub(alert.created)

// 1. Maintain the ERROR state if the condition is still met
case item.state != 'running':
    return ERROR, "Item state is @item.state"

case var.duration < 600:
    // Note: with a plain return, the `ticks` do not increase
    return

// Otherwise, resolve
return OK
```

