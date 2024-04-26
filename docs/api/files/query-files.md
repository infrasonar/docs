# Query container files
**`GET` /container/<containerId\>/files?fields=...**

### Description
Query all files for a given container.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | `id`              | Fields to return _(see fields below for all available fields)_.

### Fields
Field               | Return type       | Description
--------------------|------------------ |-------------
`id`                | integer           | Key string of the alert.
`size`              | integer           | Initial message when the alert was opened.
`created`           | integer           | Unix timestamp in seconds when the file was created in InfraSonar.
`type`              | string            | One of `xml`, `json`, `docx`, `xlsx`, `csv`, `pdf`, `image`, `text`, `markdown`, `compressed` or `unknown`.
`name`              | string            | File name.
`labels`            | array(integer)    | List with label Ids.

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
    -X GET 'https://api.infrasonar.com/container/123/files?fields=id,name,type' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "id": 456,
        "name": "network-diagram.png",
        "type": "image"
    }
]
```
