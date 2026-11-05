# Move asset
**`POST`  /asset/<assetId\>/move**

### Description
Move asset to another container.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`       | Asset Id.

### Query parameters
_none_

### Body
Param               | Type      | Required  | Description
--------------------|-----------|-----------|-------------
`targetContainerId` | integer   | Yes       | Target container Id.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400` 	| Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ASSET_MANAGEMENT`)_.
`404`       | Asset not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/asset/123/move' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    --data-raw '{
    "targetContainerId": 100
}'
```
