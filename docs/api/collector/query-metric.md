# Query metric
**`GET` /collector/<collectorKey\>/check/<checkKey>/type/<typeKey>/metric/<metricKey>?fields=...**

### Description
Query metric.

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
`format`            | _none_            | Format fields. The result will include "_format_" with a _format_ object _(see [Format](#format) below for all available format fields)_.
`ref`               | _none_            | Ref type fields. The result will include "_ref_" with a _ref_ object _(see [Ref](#ref) below for all available ref fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Metric key.
`name`              | string        | Metric display name.
`aggregationMethod` | string/null   | Aggregation method. One of `First`, `Last`, `Append`, `AppendUnique`, `MergeSort`, `MergeSortUnique`, `Sum`, `Mean`, `Median`, `MedianHigh`, `MedianLow`, `Maximum`,`Minimum` or `Mode`.
`dataType`          | string        | Data type. One of `Bool`, `Int`, `Float`, `String`, `ListBool`, `ListInt`, `ListFloat` or `ListString`.
`required`          | boolean       | When `true`, a non-`null` value is required for the metric.

### Format
Field               | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Format key.
`name`              | string        | Format name.
`category`          | string        | Format category. One of `General`, `Duration`, `Date & Time`, `Numbers & Currency`, `Status & Highlighting`,
`Data Size & Rate`, `Distance`, `Temperature`, `Signal & Frequency`,`Electrical & Power` or `Text`.
`valueType`         | string        | Value type. One of `Any`, `Numeric`, `Text`.
`example`           | boolean       |

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
    -X GET 'https://api.infrasonar.com/collector/http/check/http/type/http/metric/responseTime?fields=key,dataType&format=key' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "key": "responseTime",
    "dataType": "Float",
    "format": {
        "key": "HumanizedSeconds",
    }
}
```
