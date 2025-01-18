# Set label name
**`PATCH` /label/<labelId\>/name**

### Description
Set the label name. Success _(204)_ is also returned when the label name has not been changed.

### Path parameters
Param               | Description
--------------------|-------------
`labelId`           | Label Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`name`      | string    | Yes       | Label name.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CONTAINER_ADMIN`)_.
`404`       | Label not found.

### Example
Curl request:
```bash
curl \
    -X PATCH 'https://api.infrasonar.com/label/123/name' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "name": "This is cool label!"
}'
```
