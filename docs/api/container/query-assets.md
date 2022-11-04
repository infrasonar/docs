# Query container assets
**`GET` /container/<containerId\>/assets?fields=...**

### Description
Query all assets for a given container. _(removed assets are not included)_.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`           | Container Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | `id`              | Fields to return _(see fields below for all available fields)_.

### Fields
Field               | Return type       | Description
--------------------|-------------------|-------------
`id`                | integer           | Asset Id.
`name`              | string            | Asset name.
`description`       | string            | Asset description.
`mode`              | string            | One of `normal`, `maintenance` or `disabled`.

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
    -X GET 'https://api.infrasonar.com/container/123/assets?fields=id,name,mode' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "id": 123,
        "name": "my-host.local",
        "mode": "normal"
    }
]
```
