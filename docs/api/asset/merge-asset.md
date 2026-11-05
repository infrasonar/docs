# Merge asset
**`POST`  /asset/<assetId\>/merge**

### Description
Merge asset into another asset.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`       | Target asset Id.

### Query parameters
_none_

### Body
Param            | Type           | Required  | Description
-----------------|----------------|-----------|-------------
`sourceAssetIds` | array(integer) | Yes       | Source asset Ids.

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
    -X GET 'https://api.infrasonar.com/asset/123/merge' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    --data-raw '{
    "sourceAssetIds": [124, 125]
}'
```
