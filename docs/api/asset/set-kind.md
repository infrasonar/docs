# Set asset mode
**`PATCH` /asset/<assetId\>/kind**

### Description
Set the asset kind. Success _(204)_ is also returned when the asset kind remains unchanged.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`kind`      | string    | Yes       | Asset kind. See table below for all available kinds.

### Kind

Logo                                                                                                        | Name
------------------------------------------------------------------------------------------------------------| --------
<img src="https://app.infrasonar.com/static/images/hosticons/unknown.png" style="margin:0; width:20px;"/>   | `Unknown`
<img src="https://app.infrasonar.com/static/images/hosticons/linux.png" style="margin:0; width:20px;"/>     | `Linux`
<img src="https://app.infrasonar.com/static/images/hosticons/windows.png" style="margin:0; width:20px;"/>   | `Windows`
<img src="https://app.infrasonar.com/static/images/hosticons/docker.png" style="margin:0; width:20px;"/>    | `Docker`
<img src="https://app.infrasonar.com/static/images/hosticons/vmware.png" style="margin:0; width:20px;"/>    | `VMware`

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ASSET_MANAGEMENT`)_.
`404`       | Asset not found.

### Example
Curl request:
```bash
curl \
    -X PATCH 'https://api.infrasonar.com/asset/123/kind' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "kind": "Linux"
}'
```
