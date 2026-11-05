# Query move queue
**`GET` /container/<containerId\>/move-queue?fields=...**

### Description
Query move queue for a given container.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see fields below for all available fields)_.

### Fields
Field               | Return type       | Description
--------------------|-------------------|-------------
`id`                | integer           | Asset Id.
`name`              | string            | Asset name.
`targetContainerId` | integer           | Target container Id.
`status`            | string            | One of `pending`, `working` or `error`.
`error`             | string/null       | Move error reason.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/container/123/move-queue?fields=id,name,status,targetContainerId' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "id": 124,
        "name": "my-host.local",
        "status": "pending",
        "targetContainerId": 100
    }
]
```
