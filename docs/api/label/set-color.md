# Set label color
**`PATCH` /label/<labelId\>/color**

### Description
Set the label color. Success _(204)_ is also returned when the label color remains unchanged.

### Path parameters
Param               | Description
--------------------|-------------
`labelId`           | Label Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`color`     | string    | Yes       | Label color. See [List available colors](./colors.md#colors) for all available colors.

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
    -X PATCH 'https://api.infrasonar.com/label/123/color' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "color": "Orange"
}'
```
