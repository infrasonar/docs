# Remove collector from asset
**`DELETE` /asset/<assetId\>/collector/<collectorKey\>**

### Description
Remove a collector from an asset. Success _(204)_ is also returned when the collector was not attached to the asset.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.
`collectorKey`      | Collector key.

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
`404`       | Asset or collector not found.

### Example
Curl request:
```bash
curl \
    -X DELETE 'https://api.infrasonar.com/asset/123/collector/docker' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```
