# Query container notifications
**`GET` /container/<containerId\>/notifications?fields=...**

### Description
Query all _open_ notifications for a given container.

> With the current API it is not possible to query for _closed_ notifications, except when you have an explicit notification key string.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | `ks`              | Fields to return _(see [Fields](#fields) below for all available fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`ks`                | string        | Key string of the notification.
`message`           | string        | Notification message.
`severity`          | integer       | Notification severity _(value between 0=highest and 2=lowest severity)_.
`timestamp`         | integer       | Unix timestamp in seconds when the notification was opened.
`lastTimestamp`     | integer       | Unix timestamp in seconds of the last hit _(equal to "timestamp" with only a single hit)_.
`kind`              | string        | One of `ConnectionStatus`, `ConnectionTimeDelta`, `ProbeVersion`, `ProbeMissing`, `ProbeTimeDelta`, `ProbeNoHeartbeat`, `CheckMissing`, `CheckError`, `CheckAged`, `CheckInvalidResult`, `CheckInvalidTimestamp`, `CheckInvalidData`, `ContainerMaintenance`, `AgentcoreMissing` or `ConditionError`.
`status`            | string        | Notification status. One of `Open`, `Closed` or `Resolved`.
`hits`              | integer       | Number of consecutive hits.
`assetId`           | integer/null  | Id of the associated asset. Only applicable for `CheckMissing`, `CheckError`, `CheckAged`, `CheckInvalidResult`, `CheckInvalidTimestamp` or `CheckInvalidData` notifications.
`collector`         | string/null   | Key of the associated collector. Only applicable for `CheckMissing`, `CheckError`, `CheckAged`, `CheckInvalidResult`, `CheckInvalidTimestamp` or `CheckInvalidData` notifications.
`check`             | string/null   | Key of the associated check. Only applicable for `CheckMissing`, `CheckError`, `CheckAged`, `CheckInvalidResult`, `CheckInvalidTimestamp` or `CheckInvalidData` notifications.
`closedTimestamp`   | integer/null  | Unix timestamp in seconds when the notification was closed or _null_ if not closed.
`closedBy`          | integer/null  | Id of the user who closed the notification or _null_ if not closed.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/container/123/notifications?fields=ks,message,severity' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "ks": "<a-unique-key-string>",
        "message": "Check is missing _(can happen if the check is new for this asset)_",
        "severity": 2
    }
]
```
