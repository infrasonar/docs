# List available metric formats:
**`GET` /collector/metric-formats**

### Description
Returns a list of available metric formats. Metric formats define how raw metric values are formatted.

### Format
Field               | Data type     | Description
--------------------|---------------|-------------
`key`               | string        | Format key.
`name`              | string        | Format name.
`category`          | string        | Category used to group similar formats (e.g., `General`, `Data Size & Rate`).
`valueType`         | string        | Supported metric value type. One of `Any`, `Numeric`, `Text`.
`example`           | string        | Example showing how a raw value is transformed into its formatted representation.

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
    -X GET 'https://api.infrasonar.com/collector/metric-formats' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
  {
    "key": "None",
    "name": "Default (Raw Value)",
    "category": "General",
    "valueType": "Any",
    "example": "42 => \"42\""
  },
  {
    "key": "BytesPerSecond",
    "name": "Data Rate from Bytes/s (B/s, kB/s, MB/s)",
    "category": "Data Size & Rate",
    "valueType": "Numeric",
    "example": "1250000 => \"1.25 MB/s\""
  },
  ...
]
```
