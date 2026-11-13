# Query condition
**`GET` /container/<containerId\>/condition/<conditionId\>?fields=...**

### Description
Query condition details.

### Path parameters
Param               | Description
--------------------|-------------
`conditionId`       | Condition Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see [Fields](#fields) below for all available fields)_.

### Fields
Field               | Return type        | Description
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
`404`       | Condition not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/container/123/condition/456?fields=name,kind' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "name": "test",
    "kind": "ItemExpression"
}
```
