# Set asset zone
**`PATCH` /asset/<assetId\>/zone**

### Description
Set the asset zone. Success _(204)_ is also returned when the asset was already in the desired zone.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`zone`      | integer   | Yes       | Zone Id (between 0 and 9).

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
    -X PATCH 'https://api.infrasonar.com/asset/123/zone' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "zone": 1
}'
```
