# Query checks
**`GET` /collector/<collectorKey\>/check/<checkKey>/type/<typeKey>/metrics?fields=...**

### Description
Query types.

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
`format`            | _key_             | Format fields. The result will include "_format_" with a _format_ object _(see [Format](#format) below for all available report fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Metric key.
`name`              | string        | Metric display name.
`dataAggregation`   | string        |
`dataType`          | string        |
`fileIdLink`        | boolean       |
`required`          | boolean       |

### Format
Field               | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Format key.
`name`              | string        | Format name.
`category`          | string        |
`valueType`         | string        | Value type. One of `Any`, `Numeric`, `Text`.
`example`           | boolean       |

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
    -X GET 'https://api.infrasonar.com/collector/http/check/http/type/http/metrics?fields=key,dataType' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "key": "name",
        "dataType": "String",
        "format": {
            "key": "None",
        }
    },
    {
        "key": "payload",
        "dataType": "String",
        "format": {
            "key": "None",
        }
    },
    {
        "key": "responseTime",
        "dataType": "Float",
        "format": {
            "key": "HumanizedSeconds",
        }
    },
    {
        "key": "statusCode",
        "dataType": "Integer",
        "format": {
            "key": "None",
        }
    },
]
```
