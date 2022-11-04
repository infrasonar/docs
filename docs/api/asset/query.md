# Query asset
**`GET`/asset/<assetId\>?fields=...**

### Description
Query asset details.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see fields below for all available fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`id`                | integer       | Asset Id.
`name`              | string        | Asset name.
`description`       | string        | Asset description.
`mode`              | string        | One of `normal`, `maintenance` or `disabled`.


### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Asset not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/asset/123' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "id": 123,
    "name": "my-host.local",
    "description": "My host",
    "mode": "normal"
}
```
