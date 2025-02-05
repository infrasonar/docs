# Set agentcore zone
**`PATCH` /agentcore/<agentcoreId\>/zone**

### Description
Set the agentcore zone. Success _(204)_ is also returned when the agentcore was already in the desired zone.

This requires the [Remote Appliance (RAPP)](https://github.com/infrasonar/rapp) to be installed and connected. Use [query-agentcores](../../container/query-agentcores) to find if RAPP is connected.

### Path parameters
Param               | Description
--------------------|-------------
`agentcoreId`       | Agentcore Id.

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
`403`       | Insufficient permissions _(required: `API`+`CORE_CONNECT`)_.
`404`       | Agentcore not found.
`500`       | RAPP Error.
`503`       | Remote appliance (RAPP) can be in state: `busy`, `agentcore not connected` or `rapp not connected`. All states may be temporary and can be tried again.

### Example
Curl request:
```bash
curl \
    -X PATCH 'https://api.infrasonar.com/agentcore/123/zone' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "zone": 1
}'
```
