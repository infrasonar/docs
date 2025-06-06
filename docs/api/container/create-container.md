# Create container
**`POST` /container/<containerId\>/container**

### Description
Create a new child container.

> Duplicated container names are not allowed.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id _(from the parent container)_.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`name`      | string    | Yes       | Name of the container.
`timezone`  | string    | No        | Timezone for the new container. Example: `Europe/Amsterdam` _(By default the zone is inherited from the parent container)_.

### Return codes
Error code  | Reason
------------|--------
`201`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CONTAINER_MANAGEMENT`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/container/123/container' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "name": "my-child-container"
}'
```

Response:
```json
{
    "containerId": 456
}
```
