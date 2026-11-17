# Query checks
**`GET` /collector/<collectorKey\>/check/<checkKey>/types?fields=...**

### Description
Query types.

### Path parameters
Param               | Description
--------------------|-------------
`collectorKey`      | Collector key.
`checkKey`          | Check key.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see [Fields](#fields) below for all available fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Type key.
`name`              | string        | Type name.
`optional`          | boolean       |
`single`            | boolean       |


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
    -X GET 'https://api.infrasonar.com/collector/http/check/http/types?fields=key,optional,single' \
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
