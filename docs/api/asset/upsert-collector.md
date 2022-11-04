# Upsert collector to asset
**`POST` /asset/<assetId\>/collector/<collectorKey\>**

### Description
Add or configure a collector on an asset. If the collector is already attached to the asset, the configuration will be updated unless no configuration is provided in the body.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.
`collectorKey`      | Collector key.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`config`    | Object    | Depends   | Configuration of the collector.

_A body might be required for some collectors. For most collectors the `config` field is optional._


### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ASSET_MANAGEMENT`)_.
`404`       | AssetId or collectorKey not found.

### Example
Curl request: _(no config required for docker agent)_
```bash
curl \
    -X POST 'https://api.infrasonar.com/asset/123/collector/docker' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```
