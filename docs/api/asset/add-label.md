# Add label to asset
**`POST` /asset/<assetId\>/label/<labelId\>**

### Description
Add a label to an asset. Success _(204)_ is also returned when the label was already assigned to the asset.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.
`labelId`           | Label Id.

### Query parameters
_none_

### Body
_none_

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ASSET_MANAGEMENT`)_.
`404`       | AssetId or labelId not found.

### Example
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/asset/123/label/123' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```
