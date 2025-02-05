# Remove agentcore
**`DELETE` /agentcore/<agentcoreId\>**

### Description
Delete an agentcore.

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
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CORE_CONNECT`)_.
`404`       | Agentcore not found.

### Example
Curl request:
```bash
curl \
    -X DELETE 'https://api.infrasonar.com/agentcore/123' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```
