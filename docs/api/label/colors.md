# List available colors:
**`GET` /label/colors**

### Description
Returns a list of supported label color names.

See the [Colors](#colors) table below for the currently supported options. Use this endpoint to dynamically fetch the up-to-date list of available colors, as new colors may be introduced in future releases.

### Colors

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
    -X GET 'https://api.infrasonar.com/label/colors' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
  "Steel",
  "Olive",
  "Mauve",
  "Emerald",
  "Orange",
  "Magenta",
  "Cherry",
  "Gold",
  "InfraSonarBlue"
]
```
