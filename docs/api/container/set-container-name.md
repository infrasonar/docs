# Set container name
**`PATCH`  /container/<containerId\>/name**

### Description
Set the container name.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`name`      | string    | Yes       | Name of the container.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400` 	    | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CONTAINER_MANAGEMENT`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/container/123/name' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    --data-raw '{
    "name": "New container name"
}'
```
