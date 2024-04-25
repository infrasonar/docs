# Upload file
**`GET` /container/<containerId\>/file/<fileId\>**

### Description
Download a file. For file info, see the [Query file](../query-file) section.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.
`fileId`            | File Id.

### Query parameters
_none_

### Body
_none_

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Container or file not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/container/123/file' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

_Returns with the raw file_