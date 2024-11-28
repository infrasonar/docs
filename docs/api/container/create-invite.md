# Invite a user to the container
**`PUT` /container/<containerId\>/invite**

### Description
Create an invite for a user. Invites can only be created for users which do not yet exist in InfraSonar. For existing users, use the [add user](../add-user) and [update-user](../update-user) API handlers.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Body
Param                   | Type          | Required  | Description
------------------------|---------------|-----------|-------------
`email`                 | string        | Yes       | Email for the user.
`member`                | boolean       | No        | When `true`, the user will be marked as a member. Alerts can only be assigned to members of the container. Defaults to `false`.
`permissions`           | array(string) | No        | Optional list with user permissions (see: [authentication flags](../add-user#authentication-flags) for a complete list).
`sendInvitationEmail`   | boolean       | No        | When `true`, an invitation will be send to the user's email address. Defaults to `true`.

### Return codes
Error code  | Reason
------------|--------
`201`       | Success.
`400`       | Invalid body or a user with this mail address already exists in InfraSonar.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CONTAINER_ACCESS`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/container/123/invite' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "email": "alice@wonderland.net",
    "member": true,
    "permissions": ["READ"],
    "sendInvitationEmail": true
}'
```
