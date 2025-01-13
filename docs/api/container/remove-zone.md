# Remove user from container
**`DELETE` /container/<containerId\>/zone/<zoneId\>**

### Description
Remove a user from the container.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.
`zoneId`            | Zone Id.

### Query parameters
_none_

### Body
_none_

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
    -X DELETE 'https://api.infrasonar.com/container/123/zone/0' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```
