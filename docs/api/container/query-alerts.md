# Query container alerts
**`GET` /container/<containerId\>/alerts?fields=...**

### Description
Query all _open_ alerts for a given container.

> With the current API it is not possible to query for _closed_ alerts, except when you have an explicit alert key string.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`           | Container Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | `ks`              | Fields to return _(see fields below for all available fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`ks`                | string        | Key string of the alert.
`message`           | string        | Initial message when the alert was opened.
`severity`          | integer       | Initial severity when the alert was opened _(value between 0=highest and 7=lowest severity)_.
`timestamp`         | integer       | Unix timestamp in seconds when the alert was opened.
`lastMessage`       | string        | Message of the last hit _(equal to "message" with only a single hit)_.
`lastSeverity`      | integer       | Severity of the last hit _(equal to "severity" with only a single hit)_.
`lastTimestamp`     | integer       | Unix timestamp in seconds of the last hit _(equal to "timestamp" with only a single hit)_.
`ownerId`           | integer/null  | User Id of the owner or _null_ when the alert is not assigned to an owner.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | AssetId not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/container/123/alerts?fields=ks,message,severity,ownerId' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "ks": "<a-unique-key-string>",
        "message": "Initial message of the alert",
        "severity": 3,
        "ownerId": null
    }
]
```
