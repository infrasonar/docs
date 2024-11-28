# Remove invite from container
**`DELETE` /container/<containerId\>/invite**

### Description
Remove an invite from a container. Returns `204` even if the invite does not exist.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Body
Param           | Type          | Required  | Description
----------------|---------------|-----------|-------------
`email`         | string        | Yes       | Email for the invite to remove.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CONTAINER_ACCESS`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X DELETE 'https://api.infrasonar.com/container/123/invite' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "email": "alice@wonderland.net"
}'
```
