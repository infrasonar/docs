# Keyword: `new`

The `new` keyword allows you to identify whether an item is being detected for the first time by InfraSonar.

The `new` keyword evaluates to `true` if the item has no previous historical data in InfraSonar, and `false` otherwise.

## Example: Alerting on New Items

```javascript
case new:
    return DEBUG, "New item detected: @item.name"
```

In this example, an alert will be triggered only when `@item.name` is discovered by InfraSonar for the very first time.

## Important Note on Testing:
The `new` keyword relies on an item's historical presence within the InfraSonar system. Consequently, the `new` keyword will always evaluate to `false` during expression testing.

Therefore, when testing expressions that include the `new` keyword, keep in mind that the case statement will not trigger based on new: `true`. You may need to temporarily adjust your test cases or logic to account for this.

