# Set asset mode
**`PATCH` /asset/<assetId\>/mode**

### Description
Set the asset mode. Success _(204)_ is also returned when the asset was already in the desired mode.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`mode`      | string    | Yes       | One of `normal`, `maintenance` or `disabled`.
`duration`  | integer   | No        | Duration for the mode in _minutes_. Accepts a value between `1` and `480` and only works when the mode is set to either `maintenance` or `disabled`. If `duration` is not given, the mode is changed indefinitely.

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
    -X PATCH 'https://api.infrasonar.com/asset/123/mode' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "mode": "maintenance"
}'
```
