# Query check
**`GET` /collector/<collectorKey\>/check/<checkKey>?fields=...**

### Description
Returns detailed information for a specific check within a collector. By supplying optional query parameters, you can expand the check's hierarchy in a single request—including its check types and nested metrics (along with their data, format, and reference definitions).

To inspect the full parent collector (including all checks and configuration options), see [Query collector](./query.md). If you only need to inspect a single child resource, see the dedicated endpoints for querying a [type](./query-type.md) or [metric](./query-metric.md).

### Path parameters
Param               | Description
--------------------|-------------
`collectorKey`      | Collector key.
`checkKey`          | Check key.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see [Fields](#fields) below for all available fields)_.
`types`             | _none_            | Type fields. If at least one field is given, the result will include "_types_" with an array of _type_ objects _(see [Type](./query-type.md#fields) api for all available type fields)_.
`metrics`           | _none_            | Metric fields. If at least one field is given, the result will include "_metrics_" with an array of _metric_ objects _(see [Metric](./query-metric.md#fields) api for all available metric fields)_.
`data`              | _none_            | Data fields. The result will include "_data_" with a _data_ object _(see [Data](./query-metric.md#data) api for all available data fields)_.
`format`            | _none_            | Format fields. The result will include "_format_" with a _format_ object _(see [Format](./query-metric.md#format) api for all available format fields)_.
`ref`               | _none_            | Ref type fields. The result will include "_ref_" with a _ref_ object _(see [Ref](./query-metric.md#ref) api for all available ref fields)_.
`refs`           | _none_               | Ref fields. If at least one field is given, the result will include "_refs_" with an array of _ref_ objects _(see [Refs](./query-type.md#refs) api for all available ref fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Check key.
`name`              | string        | Check name.
`interval`          | integer/null  | Check interval. Only applicable for `probe` collectors or `service` collectors.
`maxAge`            | integer/null  | Maximum age in seconds before a notification is raised if no new data is received. When `null`, no maximum age is enforced.
`mustExist`         | boolean       | Whether the check must exist.


### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Collector not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/collector/http/check/http?fields=key,interval' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "key": "http",
    "interval": 60
}
```
