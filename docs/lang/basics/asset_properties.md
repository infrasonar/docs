# Asset Properties

By exposing asset properties directly to your expressions, InfraSonar empowers you to achieve more granular control over your alerts; this enables precise asset-based filtering and exclusions according to criteria such as environment or team, alongside the ability to enhance alert messages with valuable, custom details.

Asset properties are accessed via their defined type, followed by their key:

- `asset.string.<key>`: Accesses a _single string_ property.
- `asset.strings.<key>`: Accesses a _list of strings_ property.
- `asset.number.<key>`: Accesses a _single numeric value_ (`integer` or `float`) property.
- `asset.numbers.<key>`: Accesses a _list of numeric values_ property.
- `asset.boolean.<key>`: Accesses a _single boolean_ property (`true` or `false`).

!!! note "Null properties"
    If an asset property does not exist, or if it explicitly holds a `null` value, attempting to access it will result in `null`. There is no functional difference in expression evaluation between a non-existent property and one explicitly set to `null`.


## Example 1: Using an Asset Property for Exclusion
This example demonstrates how to prevent alerts for items whose names are present in an `exclusion_list` strings property defined on the asset.

```javascript
// Return to suppress the alert if a property `exclusion_list`
// exists and `item.name` is part of the list of strings.
case item.name in asset.strings.exclusion_list?:
    return
// Continue with expression...
```

## Example 2: Including Asset Properties in an Alert Message
This example shows how to embed an asset's location property directly into an alert message, providing immediate context.
```javascript
var.asset_location = asset.string.location? ?? "Unknown Location"

case true:
    return DEBUG, "Location: @var.asset_location"
```