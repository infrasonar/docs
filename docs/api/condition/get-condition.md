# Query condition
**`GET` /container/<containerId\>/condition/<conditionId\>?fields=...**

### Description
Query condition details.

### Path parameters
Param               | Description
--------------------|-------------
`conditionId`           | Condition Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see fields below for all available fields)_.

### Fields
Field               | Return type        | Description
--------------------|--------------------|-------------
`id`                | integer            | Condition Id.
`name`              | string             | Condition name.
`kind`              | string             | One of `ItemExpression`, `ItemMissing`, `ItemsMustExist`.
`description`       | string             | Condition description.
`expression`        | string/null        | Condition expression when kind `ItemExpression` or `ItemMissing`.
`singleAlert`       | boolean            | Gathers up all alerts into a single alert per asset.
`closeOnReturn`     | boolean/null       | Close the alert when a missing item returns. Only available when kind `ItemMissing`.
`ticks`             | integer/null       | The number of times this condition must be hit in a row before an actual alert will be raised.
`severity`          | integer/null       | Severity. Only available when kind `ItemsMustExist`.
`collectorKey`      | string             | Collector key.
`checkKey`          | string             | Check key.
`typeKey`           | string             | Type key.
`ignoreCase`        | boolean/null       | Case insensive item name match. Only available when kind `ItemsMustExist`.
`itemsRe`           | boolean/null       | Item match pattern. Only available when kind `ItemsMustExist`.
`itemsList`         | array(string)/null | Item match list. Only available when kind `ItemsMustExist`.
`labels`            | array(integer)     | List with label Ids.
`ownerId`           | integer            | Container Id where the condition is created.

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
    -X GET 'https://api.infrasonar.com/condition/123?fields=name,kind' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "name": "test",
    "kind": "ItemExpression"
}
```
