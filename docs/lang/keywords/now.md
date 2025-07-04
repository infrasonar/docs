# Keyword: `now`

The `now` keyword provides the current **Unix timestamp** _(the number of seconds that have elapsed since the Unix epoch - January 1, 1970, 00:00:00 UTC)_ as an integer to the expression.

It is intentionally an integer, as the precision of monitoring checks and the practical need for time comparisons in expressions are generally at the second level.

## Example
```javascript
case item.log_time < now.sub(3600):
    return DEBUG, "Log time older than one hour: @fmt.item.log_time"

case item.log_time > now:
    return DEBUG, "Log time in the future: @fmt.item.log_time"

```
