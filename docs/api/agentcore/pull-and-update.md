# Set asset zone
**`POST` /agentcore/<agentcoreId\>/pull-and-update**

### Description
Pull and update Docker images on the appliance.

This requires the [Remote Appliance (RAPP)](https://github.com/infrasonar/rapp) to be installed and connected. Use [query-agentcores](../../container/query-agentcores) to find if RAPP is connected.

### Path parameters
Param               | Description
--------------------|-------------
`agentcoreId`       | Agentcore Id.

### Query parameters
_none_

### Body
_none_

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
    -X POST 'https://api.infrasonar.com/agentcore/123/pull-and-update' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```
