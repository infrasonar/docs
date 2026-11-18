# Query type
**`GET` /collector/<collectorKey\>/check/<checkKey>/type/<typeKey>?fields=...**

### Description
Query type.

### Path parameters
Param               | Description
--------------------|-------------
`collectorKey`      | Collector key.
`checkKey`          | Check key.
`typeKey`           | Type key.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see [Fields](#fields) below for all available fields)_.
`metrics`           | _none_            | Metric fields. If at least one field is given, the result will include "_metrics_" with an array of _metric_ objects _(see [Metric](./query-metric.md#fields) api for all available metric fields)_.
`refs`           | _none_               | Ref fields. If at least one field is given, the result will include "_refs_" with an array of _ref_ objects _(see [Refs](#refs) below for all available ref fields)_.
`format`            | _none_            | Format fields. The result will include "_format_" with a _format_ object _(see [Format](./query-metric.md#format) api for all available format fields)_.
`ref`               | _none_            | Ref type fields. The result will include "_ref_" with a _ref_ object _(see [Ref](./query-metric.md#ref) api for all available ref fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Type key.
`name`              | string        | Type name.
`optional`          | boolean       |
`single`            | boolean       |

### Refs
Field               | Return type   | Description
--------------------|---------------|-------------
`check`             | string        | Referenced check key.
`type`              | string        | Referenced type key.
`metric`            | string        | Referenced metric key.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Collector or check not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/collector/http/check/http/type/http?fields=key,optional,single' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "key": "http",
    "optional": false,
    "single": true
}
```
