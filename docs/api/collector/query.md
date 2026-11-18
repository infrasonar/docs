# Query collector
**`GET` /collector/<collectorKey\>?fields=...**

### Description
Query collector.

### Path parameters
Param               | Description
--------------------|-------------
`collectorKey`      | Collector key.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see [Fields](#fields) below for all available fields)_.
`checks`            | _none_            | Check fields. If at least one field is given, the result will include "_checks_" with an array of _check_ objects _(see [Check](./query-check.md#fields) api for all available check fields)_.
`options`           | _none_            | Option fields. If at least one field is given, the result will include "_options_" with an array of _option_ objects _(see [Options](#options) below for all available option fields)_.
`types`             | _none_            | Type fields. If at least one field is given, the result will include "_types_" with an array of _type_ objects _(see [Type](./query-type.md#fields) api for all available type fields)_.
`metrics`           | _none_            | Metric fields. If at least one field is given, the result will include "_metrics_" with an array of _metric_ objects _(see [Metric](./query-metric.md#fields) api for all available metric fields)_.
`data`              | _none_            | Data fields. The result will include "_data_" with a _data_ object _(see [Data](./query-metric.md#data) api for all available data fields)_.
`format`            | _none_            | Format fields. The result will include "_format_" with a _format_ object _(see [Format](./query-metric.md#format) api for all available format fields)_.
`ref`               | _none_            | Ref type fields. The result will include "_ref_" with a _ref_ object _(see [Ref](./query-metric.md#ref) api for all available ref fields)_.
`refs`           | _none_               | Ref fields. If at least one field is given, the result will include "_refs_" with an array of _ref_ objects _(see [Refs](./query-type.md#refs) api for all available ref fields)_.


### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Collector key.
`name`              | string        | Collector name.
`kind`              | string        | Collector kind. One of `Agent`, `Probe` or `Service`.
`info`              | string        | Collector info.
`minVersion`        | string        | Minimal required version for the collector.
`checks`            | array(string) | Array with check keys.

### Options
Option field     | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Option key.
`name`              | string        | Option name.
`info`              | string        | Option info.
`type`              | string        | One of `Bool`, `Int`, `Float`, `String`, `ListBool`, `ListInt`, `ListFloat` or `ListString`.
`default`           | any           | Default value _(The default value is not guaranteed to pass the validation function)_.

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
    -X GET 'https://api.infrasonar.com/collector/http?fields=key,kind' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "key": "http",
    "kind": "Probe"
}
```
