# Modify file
**`PUT` /container/<containerId\>/file/<fileId\>**

### Description
Rename the file or change the attached labels for a file.

Note that if _labels_ are provided, they will overwrite existing labels.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.
`fileId`            | File Id.

### Body
Param           | Type          | Required  | Description
----------------|---------------|-----------|-------------
`name`          | string        | No        | New file name.
`labels`        | array(integer)| No        | Overwrite labels. Be careful with an empty list as this will remove all labels from the file.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ASSET_MANAGEMENT`)_.
`404`       | Container, file or one of the labels not found.

### Example
Curl request:
```bash
curl \
    -X PUT 'https://api.infrasonar.com/container/123/file/456' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "name": "My file.docx",
    "labels": [456, 789]
}'
```
