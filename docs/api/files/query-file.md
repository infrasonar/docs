# Upload file
**`GET` /container/<containerId\>/file/<fileId\>/info?fields=...**

### Description
Query file info. For downloading the file, see the [Download file](../download-file) section.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.
`fileId`            | File Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see fields below for all available fields)_.

### Body
_none_

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
`404`       | Container or file not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/container/123/file/456/info?fields=id,name,labels' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "id": 456,
    "name": "network-diagram.png",
    "labels": [789]
}
```