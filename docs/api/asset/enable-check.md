# Enable check on asset
**`PUT` /asset/<assetId\>/collector/<collectorKey\>/check/<checkKey\>**

### Description
Enable a check on an asset. Success _(204)_ is also returned when the check was already enabled on the asset.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.
`collectorKey`      | Collector key.
`checkKey`          | Check key.

### Query parameters
_none_

### Body
_none_

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CHECK_MANAGEMENT`)_.
`404`       | Asset, collector or check not found.
`409`       | Both the asset and check exist, but the check does not exist on the asset.

### Example
Curl request:
```bash
curl \
    -X PUT 'https://api.infrasonar.com/asset/123/collector/wmi/check/updates' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```
