# Set collector display
**`PATCH` /container/<containerId\>/collector/<collectorKey\>**

### Description
Set collector display.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.
`collectorKey`      | Collector key.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`display`   | boolean   | Yes       | When `true`, the collector visible on this container.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Unknown field or invalid query param.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CONTAINER_MANAGEMENT`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X PATCH 'https://api.infrasonar.com/container/123/collector/wmi' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "display": true
}'
```
