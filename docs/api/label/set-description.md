# Set label description
**`PATCH` /label/<labelId\>/description**

### Description
Set the label description. Success _(204)_ is also returned when the label description has not changed.

### Path parameters
Param               | Description
--------------------|-------------
`labelId`           | Label Id.

### Query parameters
_none_

### Body
Param           | Type      | Required  | Description
----------------|-----------|-----------|-------------
`description`   | string    | Yes       | Label description.

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
    -X PATCH 'https://api.infrasonar.com/label/123/description' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "description": "This is a nice label!"
}'
```
