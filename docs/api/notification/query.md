# Query notification
**`GET` /notification/<notificationKs\>?fields=...&actions=...**

### Description
Query notification details. This API call will work for both an open _and_ closed notification.

### Path parameters
Param               | Description
--------------------|-------------
`notificationKs`           | Notification key string _(ks)_.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see [Fields](#fields) below for all available fields)_.

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
`400`       | Unknown field or invalid notification key string.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Notification not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/notification/xxx' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "ks": "<a-unique-key-string>",
    "identifierId": 456,
    "indexId": 42,
    "kind": "CheckMissing",
    "message": "Check is missing _(can happen if the check is new for this asset)_",
    "severity": 2,
    "timestamp": 1667511262,
    "lastTimestamp": 1667511523,
    "closedTimestamp": null,
    "closedBy": null
}
```
