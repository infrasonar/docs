# Query container collectors
**`POST` /container/<containerId\>/properties**

### Description
Create a property. Existing properties will be overwritten.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`id`        | int       | Yes       | Target Id wherefore the property will be created.
`kind`      | string    | Yes       | Must be one of `Asset`, `Container`, `Condition` or `User`.
`key`       | string    | Yes       | Property key.
`value`     | any       | Yes       | Property value which can be a _string_, _number_, _boolean_ or _null_.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Unknown field or invalid query param.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ASSET_MANAGEMENT`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/container/123/properties' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "id": 123,
    "kind": "Asset",
    "key": "my_prop",
    "value": "some value"
}'
```

