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
`color`     | string    | Yes       | Label color. See table below for all available colors.

### Kind

Color                                   | Name
----------------------------------------|------------------------
<span style="color:#5f7789;">⬤</span>  | `Steel` _(default)_
<span style="color:#668860;">⬤</span>  | `Olive`
<span style="color:#795f8d;">⬤</span>  | `Mauve`
<span style="color:#008d00;">⬤</span>  | `Emerald`
<span style="color:#ff5b00;">⬤</span>  | `Orange`
<span style="color:#ec0074;">⬤</span>  | `Magenta`
<span style="color:#990f02;">⬤</span>  | `Cherry`
<span style="color:#fcae1e;">⬤</span>  | `Gold`
<span style="color:#436caa;">⬤</span>  | `InfraSonarBlue` _(reserved for global labels)_

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
