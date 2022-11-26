# Set asset kind
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

Logo                                                                                                            | Name
----------------------------------------------------------------------------------------------------------------|---------
<img src="https://app.infrasonar.com/static/images/hosticons/asset.png" style="margin:0; width:20px;"/>         | `Asset` _(default)_
<img src="https://app.infrasonar.com/static/images/hosticons/apc.png" style="margin:0; width:20px;"/>           | `APC`
<img src="https://app.infrasonar.com/static/images/hosticons/apple.png" style="margin:0; width:20px;"/>         | `Apple`
<img src="https://app.infrasonar.com/static/images/hosticons/azure.png" style="margin:0; width:20px;"/>         | `Azure`
<img src="https://app.infrasonar.com/static/images/hosticons/citrix.png" style="margin:0; width:20px;"/>        | `Citrix`
<img src="https://app.infrasonar.com/static/images/hosticons/dell.png" style="margin:0; width:20px;"/>          | `Dell`
<img src="https://app.infrasonar.com/static/images/hosticons/dns.png" style="margin:0; width:20px;"/>           | `DNS`
<img src="https://app.infrasonar.com/static/images/hosticons/docker.png" style="margin:0; width:20px;"/>        | `Docker`
<img src="https://app.infrasonar.com/static/images/hosticons/eaton.png" style="margin:0; width:20px;"/>         | `Eaton`
<img src="https://app.infrasonar.com/static/images/hosticons/firewall.png" style="margin:0; width:20px;"/>      | `Firewall`
<img src="https://app.infrasonar.com/static/images/hosticons/freebsd.png" style="margin:0; width:20px;"/>       | `FreeBSD`
<img src="https://app.infrasonar.com/static/images/hosticons/hp.png" style="margin:0; width:20px;"/>            | `HP`
<img src="https://app.infrasonar.com/static/images/hosticons/linux.png" style="margin:0; width:20px;"/>         | `Linux`
<img src="https://app.infrasonar.com/static/images/hosticons/netapp.png" style="margin:0; width:20px;"/>        | `NetApp`
<img src="https://app.infrasonar.com/static/images/hosticons/paloalto.png" style="margin:0; width:20px;"/>      | `PaloAlto`
<img src="https://app.infrasonar.com/static/images/hosticons/purestorage.png" style="margin:0; width:20px;"/>   | `PureStorage`
<img src="https://app.infrasonar.com/static/images/hosticons/supermicro.png" style="margin:0; width:20px;"/>    | `Supermicro`
<img src="https://app.infrasonar.com/static/images/hosticons/switch.png" style="margin:0; width:20px;"/>        | `Switch`
<img src="https://app.infrasonar.com/static/images/hosticons/synology.png" style="margin:0; width:20px;"/>      | `Synology`
<img src="https://app.infrasonar.com/static/images/hosticons/vmware.png" style="margin:0; width:20px;"/>        | `VMware`
<img src="https://app.infrasonar.com/static/images/hosticons/website.png" style="margin:0; width:20px;"/>       | `Website`
<img src="https://app.infrasonar.com/static/images/hosticons/windows.png" style="margin:0; width:20px;"/>       | `Windows`


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
