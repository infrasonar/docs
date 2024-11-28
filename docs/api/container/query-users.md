# Query container users
**`GET` /container/<containerId\>/users?fields=...**

### Description
Query all users for a given container.

!!! info

    Only users from accessible containers or those with the `member` property set to `true` are returned.


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
`id`                | int               | Id for the user.
`name`              | string            | Name for the user.
`email`             | string            | Email for the user.
`authProvider`      | string            | Authentication provider for the user. One of `Google`, `Microsoft` or `Password`.
`inherit`           | boolean           | `True` when the user is inherited from another container, `False` if the user is added to the container.
`member`            | boolean           | `True` when the user is markered as a member. Alerts can only be assigned to members of the container.
`mute`              | boolean           | `True` when the user is muted, `False` if the user is active.
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
