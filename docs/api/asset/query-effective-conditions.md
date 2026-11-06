# Query effective conditions
**`GET` /asset/<assetId\>/effective-conditions?fields=...**

### Description
Query effective conditions.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Condition Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see [Fields](#fields) below for all available fields)_.
`activity`          | _none_            | Activity fields. If at least one field is given, the result will include "_activity_" with an array of _activity_ objects _(see [Activity](#activity) below for all available activity fields)_.
`condition`         | _none_            | Condition fields. If at least one field is given, the result will include "_condition_" with a _condtion_ object _(see [Condition](#condition) below for all available condition fields)_.

### Fields
Field               | Return type         | Description
--------------------|---------------------|-------------
`enabled`           | boolean             | Effective enabled state. `true` only when enabled for both the container and the asset; otherwise `false`.
`status`            | string              | Current evaluation state of the condition on this asset. See [Status Values](#status-values) for details.

#### Status Values

Status         | Description
---------------|-------------
`Active`       | The condition is enabled and actively being evaluated against incoming metrics.
`Disabled`     | The condition is disabled (`enabled` is `false` at the container or asset level).
`Overridden`   | The condition is a master condition that has been superseded by a linked condition on this asset.
`Dormant`      | The condition applies to the asset, but the required collector or check is not configured or enabled, so no data is evaluated.

### Activity
Action field        | Return type   | Description
--------------------|---------------|-------------
`item`              | string        | Item name.
`ticks`             | integer       |
`alertKs`           | string/null   | Alert key string _ks_.

### Condition
Condition field     | Return type        | Description
--------------------|--------------------|-------------
`id`                | integer            | Condition Id.
`name`              | string             | Condition name.
`collector`         | string             | Collector key.
`check`             | string             | Check key.
`type`              | string             | Type key.
`kind`              | string             | One of `ItemExpression`, `ItemMissing`, `ItemsMustExist`.
`description`       | string             | Condition description.
`labels`            | array(integer)     | List with label Ids.
`ownerId`           | integer            | Container Id where the condition is created.
`masterId`          | integer/null       | Condition Id of the master condition if this is a linked condition; otherwise `null`. A linked condition overrides specific fields of its master condition and replaces it during evaluation.
`expression`        | string/null        | Evaluation expression. Applicable when kind is `ItemExpression` or `ItemMissing`.
`singleAlert`       | boolean            | Gathers up all alerts into a single alert per asset. When `false`, each item will creates its own alert. Default: `false`.
`closeOnReturn`     | boolean/null       | Automatically closes the alert when a previously missing item reappears. Only applicable when kind is `ItemMissing`. Default: `false`.
`ticks`             | integer/null       | Number of consecutive matching polls required before an alert is raised (`0` triggers immediately). Not applicable when kind is `ItemMissing`. Default: `0`.
`severity`          | integer/null       | Alert severity level assigned when triggered. Only applicable when kind is `ItemsMustExist`.
`ignoreCase`        | boolean/null       | Enables case-insensitive matching for item names. Only applicable when kind is `ItemsMustExist`. Default: `false`.
`itemsRe`           | string/null        | Regular expression pattern for matching items. Only applicable when kind is `ItemsMustExist`.
`itemsList`         | array(string)/null | Explicit list of item names to match. Only applicable when kind is `ItemsMustExist`.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Asset not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/asset/123/effective-conditions?activity=item,ticks&condition=name,kind' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "activity": [
            {
                "item": "item-0",
                "ticks": 6
            }
        ],
        "condition": {
            "name": "test",
            "kind": "ItemExpression",
        },
        "enabled": true,
        "status": "Active"
    }
]
```
