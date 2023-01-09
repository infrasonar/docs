# Set asset name
**`PATCH` /asset/<assetId\>/name**

### Description
Set the asset name. Success _(204)_ is also returned when the asset name has not been changed.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`name`      | string    | Yes       | Asset name.

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
    -X PATCH 'https://api.infrasonar.com/asset/123/name' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "name": "This is cool asset!"
}'
```
