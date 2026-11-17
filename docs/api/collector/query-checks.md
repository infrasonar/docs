# Query checks
**`GET` /collector/<collectorKey\>/checks?fields=...**

### Description
Query checks.

### Path parameters
Param               | Description
--------------------|-------------
`collectorKey`      | Collector key.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see [Fields](#fields) below for all available fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Check key.
`name`              | string        | Check name.
`interval`          | integer/null  | Check interval. Only applicable for `probe` collectors or `service` collectors.
`maxAge`            | integer/null  | Check maximum age.
`mustExist`         | boolean       | Check must exsit.


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
    -X GET 'https://api.infrasonar.com/collector/http/checks?fields=key,interval' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "key": "http",
    "interval": 60,
}
```
