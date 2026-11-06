# Set container timezone
**`PATCH`  /container/<containerId\>/timezone**

### Description
Set the container timezone.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`timezone`  | string    | Yes       | Timezone for the container. See [List available timezones](./timezones.md) for all available timezones.

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
    -X GET 'https://api.infrasonar.com/container/123/timezone' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
    --data-raw '{
    "timezone": "Europe/Amsterdam"
}'
```
