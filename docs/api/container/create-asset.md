# Create asset
**`POST` /container/<containerId\>/asset**

### Description
Create a new asset.

> Duplicated asset names are allowed although not recommended.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`name`      | string    | Yes       | Name of the asset.

### Return codes
Error code  | Reason
------------|--------
`201`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ASSET_MANAGEMENT`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/container/123/asset' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "name": "my-host.local"
}'
```

Response:
```json
{
    "assetId": 456
}
```
