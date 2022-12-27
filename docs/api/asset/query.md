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
`collectors`        | _none_            | Collector fields. If at least one field is given, the result will include "_collectors_" with an array of _collector_ objects _(see Collectors below for all available collector fields)_.

### Fields
Field               | Return type       | Description
--------------------|-------------------|-------------
`id`                | integer           | Asset Id.
`name`              | string            | Asset name.
`kind`              | string            | One of the kinds _(see [set-kind](../asset/set-kind.md) api)_
`description`       | string            | Asset description.
`mode`              | string            | One of `normal`, `maintenance` or `disabled`.
`labels`            | array(integer)    | List with label Ids.

### Collectors
Collector field     | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Collector key.
`name`              | string        | Collector name.
`kind`              | string        | One of `agent`, `probe` or `service`.
`config`            | object/null   | Configuration for the collector if config exists.

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
    "kind": "Asset",
    "description": "My host",
    "mode": "normal",
    "labels": [456, 789]
}
```
