# Remove label from asset
**`DELETE` /asset/<assetId\>/label/<labelId\>**

### Description
Remove a label from an asset. Success _(204)_ is also returned when the label was not assigned to the asset.

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
`404`       | Asset or label not found.

### Example
Curl request:
```bash
curl \
    -X DELETE 'https://api.infrasonar.com/asset/123/label/123' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```
