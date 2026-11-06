# Merge asset
**`POST`  /asset/<assetId\>/merge**

### Description
Merges an asset into the target asset specified by `assetId`.

This is used to combine duplicate representations of the same physical or logical device into a single asset without losing historical monitoring data—such as merging an asset monitored by WMI with one monitored via SNMP.

#### Constraints
* **No collector overlap:** The source and target assets cannot share the same collector. Each collector associated with the assets being merged must be unique.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Target asset Id.

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
`400` 	    | Invalid body.
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
