# Query container invites
**`GET` /container/<containerId\>/invites?fields=...**

### Description
Query all pending invitations for a given container.


### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
Param       | Default       | Description
------------|---------------|-------------
`fields`    | _all fields_  | Fields to return _(see fields below for all available fields)_.

### Fields
Field               | Return type       | Description
--------------------|-------------------|-------------
`email`             | string            | Email for the user.
`member`            | boolean           | `True` when the user is markered as a member. Alerts can only be assigned to members of the container.
`permissions`       | array(string)     | List with the user permissions (see: [authentication flags](../add-user#authentication-flags) for a complete list).

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field or invalid query param.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CONTAINER_ACCESS`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/container/123/users' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "id": 123,
        "name": "Alice in Wonderland",
        "email": "alice@wonderland.net",
        "authProvider": "Password",
        "inherit": false,
        "member": true,
        "mute": false,
        "permissions": [
            "READ"
        ]
    }
]
```
