# Query container labels
**`GET` /container/<containerId\>/labels?fields=...**

### Description
Query all labels for a given container. Containers inherit parent labels, so those are included too.


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
`id`                | int               | Label Id.
`name`              | string            | Label name.
`color`             | string            | One of `Steel`, `Olive`, `Mauve`, `Emerald`, `Orange`, `Magenta` or `InfraSonarBlue`.
`description`       | string            | Label description.
`ownerId`           | int               | Container Id where the label is created.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field or invalid query param.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/container/123/labels' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "id": 456,
        "name": "Windows",
        "color": "InfraSonarBlue",
        "description": "Windows label",
        "ownerId": 123
    }
]
```
