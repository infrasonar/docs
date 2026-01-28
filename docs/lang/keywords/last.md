# Keyword: `last`

The `last` keyword is a boolean flag used to detect the final iteration of a check.

The `last` keyword evaluates to `true` if this is the final item; no more items will be processed after this.

## Example:

last is most powerful when combined with set() and get(). You can collect data during the loop and only make a decision at the end.

```javascript
// Add current item value to a running total
var.total = get('total_usage', 0).add(item.usage)
set('total_usage', var.total)

// Only alert based on the total sum at the very end
case last:
    case var.total > 1000:
        return CRITICAL, "Total usage across all items (@var.total) exceeds limit!"
    return OK, "Total usage is within limits."

```

## Important Considerations
- **Order Matters:** Place your `case last` logic at the bottom of your script if you want to ensure all other item-level logic has finished executing first.
- **Single Alert Mode:** When using `last` to send a summary, ensure your check is configured for **Single Alerting**. If not, the alert will be incorrectly associated only with the final item in the list rather than the check as a whole.

!!! info
    See Also: For a practical application of `last`, see the [append() function documentation](../../functions/append) to learn how to build lists of failing items.
