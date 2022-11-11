# Purge notifications
**`POST` /container/<containerId\>/purge-notifications**

### Description
Purge notifications by notification kind.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`kind`      | string    | Yes       | One of `ConnectionStatus`, `ConnectionTimeDelta`, `ProbeVersion`, `CheckMissing`, `CheckError`, `CheckAged`, `CheckInvalidResult`, `CheckInvalidTimestamp`, `CheckInvalidData` or `ConditionError`.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CONTAINER_MANAGEMENT`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/container/123/purge-notifications' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "kind": "ConnectionStatus"
}'
```
