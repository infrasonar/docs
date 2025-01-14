# Update user member and/or permissions
**`PUT` /container/<containerId\>/user/<userId\>**

### Description
Update user member status and/or user permissions for the container.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.
`userId`            | User Id.

### Query parameters
_none_

### Body
Param           | Type          | Required  | Description
----------------|---------------|-----------|-------------
`member`        | boolean       | No        | When `true`, the user will be marked as a member. Alerts can only be assigned to members of the container. If `member` is omitted, no change to the member status will be made.
`permissions`   | array(string) | No        | Optional list with user permissions (see: [authentication flags](../add-user#authentication-flags) for a complete list). If omitted, no permissions changes will be made. An empty list will remove all permissions.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CONTAINER_ACCESS`)_.
`404`       | Container or user not found.

### Example
Curl request:
```bash
curl \
    -X PUT 'https://api.infrasonar.com/container/123/user/456' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "member": false,
    "permissions": ["READ", "API"]
}'
```
