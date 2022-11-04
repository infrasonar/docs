# Set container mode
**`PATCH` /container/<containerId\>/mode**

### Description
Set the container mode. Success _(204)_ is also returned when the container was already in the desired mode.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`mode`      | string    | Yes       | One of `normal`, `maintenance` or `disabled`.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ASSET_MANAGEMENT`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X PATCH 'https://api.infrasonar.com/container/123/mode' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "mode": "maintenance"
}'
```
