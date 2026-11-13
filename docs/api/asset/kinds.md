# List available asset kinds
**`GET` /asset/kinds**

### Description
Returns a list of supported asset kind names.

See the [Kinds](#kinds) table below for the currently supported asset kinds. Use this endpoint to dynamically fetch the up-to-date list of available kinds, as new asset kinds may be introduced in future releases.


### Kinds

Logo                                                                                                            | Name
----------------------------------------------------------------------------------------------------------------|---------
<img src="https://app.infrasonar.com/static/images/hosticons/asset.png" style="margin:0; width:20px;"/>         | `Asset` _(default)_
<img src="https://app.infrasonar.com/static/images/hosticons/apc.png" style="margin:0; width:20px;"/>           | `APC`
<img src="https://app.infrasonar.com/static/images/hosticons/apple.png" style="margin:0; width:20px;"/>         | `Apple`
<img src="https://app.infrasonar.com/static/images/hosticons/azure.png" style="margin:0; width:20px;"/>         | `Azure`
<img src="https://app.infrasonar.com/static/images/hosticons/camera.png" style="margin:0; width:20px;"/>        | `Camera`
<img src="https://app.infrasonar.com/static/images/hosticons/cisco.png" style="margin:0; width:20px;"/>         | `Cisco`
<img src="https://app.infrasonar.com/static/images/hosticons/citrix.png" style="margin:0; width:20px;"/>        | `Citrix`
<img src="https://app.infrasonar.com/static/images/hosticons/database.png" style="margin:0; width:20px;"/>      | `Database`
<img src="https://app.infrasonar.com/static/images/hosticons/dell.png" style="margin:0; width:20px;"/>          | `Dell`
<img src="https://app.infrasonar.com/static/images/hosticons/discovery.png" style="margin:0; width:20px;"/>     | `Discovery`
<img src="https://app.infrasonar.com/static/images/hosticons/dns.png" style="margin:0; width:20px;"/>           | `DNS`
<img src="https://app.infrasonar.com/static/images/hosticons/docker.png" style="margin:0; width:20px;"/>        | `Docker`
<img src="https://app.infrasonar.com/static/images/hosticons/eaton.png" style="margin:0; width:20px;"/>         | `Eaton`
<img src="https://app.infrasonar.com/static/images/hosticons/email.png" style="margin:0; width:20px;"/>         | `Email`
<img src="https://app.infrasonar.com/static/images/hosticons/firewall.png" style="margin:0; width:20px;"/>      | `Firewall`
<img src="https://app.infrasonar.com/static/images/hosticons/freebsd.png" style="margin:0; width:20px;"/>       | `FreeBSD`
<img src="https://app.infrasonar.com/static/images/hosticons/halopsa.png" style="margin:0; width:20px;"/>       | `HaloPSA`
<img src="https://app.infrasonar.com/static/images/hosticons/hp.png" style="margin:0; width:20px;"/>            | `HP`
<img src="https://app.infrasonar.com/static/images/hosticons/kubernetes.png" style="margin:0; width:20px;"/>    | `Kubernetes`
<img src="https://app.infrasonar.com/static/images/hosticons/linux.png" style="margin:0; width:20px;"/>         | `Linux`
<img src="https://app.infrasonar.com/static/images/hosticons/liveop.png" style="margin:0; width:20px;"/>        | `LiveOP`
<img src="https://app.infrasonar.com/static/images/hosticons/netapp.png" style="margin:0; width:20px;"/>        | `NetApp`
<img src="https://app.infrasonar.com/static/images/hosticons/paloalto.png" style="margin:0; width:20px;"/>      | `PaloAlto`
<img src="https://app.infrasonar.com/static/images/hosticons/printer.png" style="margin:0; width:20px;"/>       | `Printer`
<img src="https://app.infrasonar.com/static/images/hosticons/proxmox.png" style="margin:0; width:20px;"/>       | `Proxmox`
<img src="https://app.infrasonar.com/static/images/hosticons/purestorage.png" style="margin:0; width:20px;"/>   | `PureStorage`
<img src="https://app.infrasonar.com/static/images/hosticons/speed.png" style="margin:0; width:20px;"/>         | `Speed`
<img src="https://app.infrasonar.com/static/images/hosticons/storage.png" style="margin:0; width:20px;"/>       | `Storage`
<img src="https://app.infrasonar.com/static/images/hosticons/supermicro.png" style="margin:0; width:20px;"/>    | `Supermicro`
<img src="https://app.infrasonar.com/static/images/hosticons/switch.png" style="margin:0; width:20px;"/>        | `Switch`
<img src="https://app.infrasonar.com/static/images/hosticons/synology.png" style="margin:0; width:20px;"/>      | `Synology`
<img src="https://app.infrasonar.com/static/images/hosticons/tablet.png" style="margin:0; width:20px;"/>        | `Tablet`
<img src="https://app.infrasonar.com/static/images/hosticons/unifi.png" style="margin:0; width:20px;"/>         | `UniFi`
<img src="https://app.infrasonar.com/static/images/hosticons/vehicle.png" style="margin:0; width:20px;"/>       | `Vehicle`
<img src="https://app.infrasonar.com/static/images/hosticons/vmware.png" style="margin:0; width:20px;"/>        | `VMware`
<img src="https://app.infrasonar.com/static/images/hosticons/website.png" style="margin:0; width:20px;"/>       | `Website`
<img src="https://app.infrasonar.com/static/images/hosticons/windows.png" style="margin:0; width:20px;"/>       | `Windows`

### Path parameters
_none_

### Query parameters
_none_

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/asset/kinds' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
  "Asset",
  "APC",
  "Apple",
  "Azure",
  "Camera",
  "Cisco",
  "Citrix",
  "Database",
  "Dell",
  "Discovery",
  "DNS",
  "Docker",
  "Eaton",
  "Email",
  "Firewall",
  "FreeBSD",
  "HaloPSA",
  "HP",
  "Kubernetes",
  "Linux",
  "LiveOP",
  "NetApp",
  "PaloAlto",
  "Printer",
  "Proxmox",
  "PureStorage",
  "Speed",
  "Storage",
  "Supermicro",
  "Switch",
  "Synology",
  "Tablet",
  "UniFi",
  "Vehicle",
  "VMware",
  "Website",
  "Windows"
]
```
