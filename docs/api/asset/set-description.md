# Set asset description
**`PATCH` /asset/<assetId\>/description**

### Description
Set the asset description. Success _(204)_ is also returned when the asset description has not changed.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.

### Query parameters
_none_

### Body
Param           | Type      | Required  | Description
----------------|-----------|-----------|-------------
`description`   | string    | Yes       | Asset description.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ASSET_MANAGEMENT`)_.
`404`       | Asset not found.

### Example
Curl request:
```bash
curl \
    -X PATCH 'https://api.infrasonar.com/asset/123/description' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "description": "This is cool asset!"
}'
```
