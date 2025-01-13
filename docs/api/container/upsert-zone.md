# Create or update zone
**`POST` /container/<containerId\>/zone**

### Description
Create or update a zone. Existing properties will be overwritten.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`zone`      | int       | Yes       | Zone Id.
`name`      | string    | Yes       | Zone Name.

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
    -X POST 'https://api.infrasonar.com/container/123/zone' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "id": 123,
    "kind": "Asset",
    "key": "my_prop",
    "value": "some value"
}'
```

