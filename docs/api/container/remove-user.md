# Remove user from container
**`DELETE` /container/<containerId\>/user/<userId\>**

### Description
Remove a user from the container.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.
`userId`            | Zone Id.

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
`404`       | Container or user not found.

### Example
Curl request:
```bash
curl \
    -X DELETE 'https://api.infrasonar.com/container/123/user/456' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```
