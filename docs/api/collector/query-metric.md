# Query metric
**`GET` /collector/<collectorKey\>/check/<checkKey\>/type/<typeKey\>/metric/<metricKey\>?fields=...**

### Description
Returns detailed information for a specific metric within a check type. By supplying optional query parameters, you can include the metric's data definition (`data`), UI display formatting (`format`), and outgoing reference target (`ref`) in a single request.

To inspect broader levels of the hierarchy, see [Query type](./query-type.md), [Query check](./query-check.md), or [Query collector](./query.md). For a list of all available display formats, see [List available metric formats](./metric-formats.md).

### Path parameters
Param               | Description
--------------------|-------------
`collectorKey`      | Collector key.
`checkKey`          | Check key.
`typeKey`           | Type key.
`metricKey`         | Metric key.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see [Fields](#fields) below for all available fields)_.
`data`              | _none_            | Data fields. The result will include "_data_" with a _data_ object _(see [Data](#data) below for all available data fields)_.
`format`            | _none_            | Format fields. The result will include "_format_" with a _format_ object _(see [Format](#format) below for all available format fields)_.
`ref`               | _none_            | Ref type fields. The result will include "_ref_" with a _ref_ object _(see [Ref](#ref) below for all available ref fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Metric key.
`name`              | string        | Metric display name.

### Data
Field               | Return type   | Description
--------------------|---------------|-------------
`aggregation`       | string/null   | Aggregation method. One of `First`, `Last`, `Append`, `AppendUnique`, `MergeSort`, `MergeSortUnique`, `Sum`, `Mean`, `Median`, `MedianHigh`, `MedianLow`, `Maximum`,`Minimum` or `Mode`.
`type`              | string        | Data type. One of `Bool`, `Int`, `Float`, `String`, `ListBool`, `ListInt`, `ListFloat` or `ListString`.
`required`          | boolean       | When `true`, a non-`null` value is required for the metric.

### Format
Field               | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Format key.
`name`              | string        | Format name.
`category`          | string        | Category used to group similar formats (e.g., `General`, `Data Size & Rate`).
`valueType`         | string        | Supported metric value type. One of `Any`, `Numeric`, `Text`.
`example`           | string        | Example showing how a raw value is transformed into its formatted representation.

### Ref
Field               | Return type   | Description
--------------------|---------------|-------------
`check`             | string        | Referenced check key.
`type`              | string        | Referenced type key.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Collector, check or type not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/collector/http/check/http/type/http/metric/responseTime?fields=key&data=type&format=key' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "key": "responseTime",
    "data": {
        "type": "Float"
    },
    "format": {
        "key": "HumanizedSeconds"
    }
}
```
