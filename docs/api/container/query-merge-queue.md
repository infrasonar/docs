# Query merge queue
**`GET` /container/<containerId\>/merge-queue?fields=...**

### Description
Query merge queue for a given container.

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
`targetAssetId`     | integer           | Target asset Id.
`status`            | string            | One of `pending`, `working` or `error`.
`error`             | string/null       | Merge error reason.

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
    -X GET 'https://api.infrasonar.com/container/123/merge-queue?fields=id,name,status,targetAssetId' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "id": 124,
        "name": "my-host.local",
        "status": "pending",
        "targetAssetId": 125
    }
]

```
