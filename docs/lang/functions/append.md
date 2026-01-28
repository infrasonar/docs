# Function: `append`

The `append()` function adds a value to an existing list and returns the updated list. To use it effectively for aggregating data across multiple items, you must initialize your variable using a `get()` call with an empty list as the fallback.

!!! info
    Append modifies a list object. It cannot be used directly on `item` data (e.g., `item.tags`), as item data is read-only.

## Syntax:
```
<list>.append(<value>)
```

## Example: Aggregating Alerts

This pattern allows you to collect names of failing servers across an entire check and fire a single, summarized alert at the end.

```javascript
// 1. Define the message template (supports multi-line and #for loops)
var.template = "
The following servers are in error state:

#for @name in @var.servers:
- @name
#end
"

// 2. Load existing list or initialize a new one if it doesn't exist
// The default value [] is required to make .append() work on the first run
var.servers = get('servers', []).append(item.name)
var.num = var.servers.len()

// 3. If current item is in error, save the updated list to persistent state
case item.status == 'error':
    set('servers', var.servers)

// 4. On the final item evaluation, determine the alert severity
case last:
    case var.num >= 3:
        return CRITICAL, var.template
    case var.num >= 1:
        return ERROR, var.template

return OK
```

## How it works

1. **Initialization:** `get('servers', [])` attempts to retrieve the list from the global state. If no `set(..)` has been called before, it creates an empty list `[]`.
2. **Collection:** We use `set()` to persist an updated list of servers if the `item.status` is `'error'`.
3. **Final Evaluation:** The `last` keyword triggers only once. It checks the total count (`var.num`) of the accumulated list.
    - **3+ Servers:** Returns CRITICAL.
    - **1-2 Servers:** Returns ERROR.
    - **0 Servers:** Returns OK.

!!! Tip "Single Alert"
    Ensure the _"Single Alert"_ option is enabled in your check configuration. This ensures the alert is treated as a single aggregate event rather than an alert for the specific individual item that happened to be evaluated last.

    A **Single Alert** auto-closes if the entire result is empty _(no items)_, or if at least one expression returns `OK` while no other items trigger an alert.