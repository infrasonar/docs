# Delete a file
**`DELETE` /container/<containerId\>/file/<fileId\>**

### Description
Delete a file.

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
`204`       | Success.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ASSET_MANAGEMENT`)_.
`404`       | Container or file not found.

### Example
Curl request:
```bash
curl \
    -X DELETE 'https://api.infrasonar.com/container/123/file/456' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```
