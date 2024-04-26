# Query alert
**`GET` /alert/<alertKs\>?fields=...&actions=...**

### Description
Query alert details. This API call will work for both an open _and_ closed alert.

### Path parameters
Param               | Description
--------------------|-------------
`alertKs`           | Alert key string _(ks)_.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see fields below for all available fields)_.
`actions`           | _none_            | Action fields. If at least one field is given, the result will include "_actions_" with an array of _action_ objects _(see Actions below for all available action fields)_.

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
`closedTimestamp`   | integer/null  | Unix timestamp in seconds when the alert was closed or _null_ if not closed.

### Actions
Action field        | Return type   | Description
--------------------|---------------|-------------
`kind`              | string        | One of: `Assign`, `Comment`, `IntegrationCall`, `Close`, `AutoClose`, `IndirectClose`
`timestamp`         | integer       | Unix timestamp in seconds.
`data`              | object/null   | Additional data object.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field or action or invalid alert key string.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Alert not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/alert/xxx?actions=kind,timestamp,data' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "ks": "<a-unique-key-string>",
    "message": "Initial message of the alert",
    "severity": 3,
    "timestamp": 1667511262,
    "lastMessage": "Last message of the alert",
    "lastSeverity": 3,
    "lastTimestamp": 1667511523,
    "ownerId": 123,
    "closedTimestamp": null,
    "actions": [
        {
            "kind": "Assign",
            "timestamp": 1667511469,
            "data": {
                "userId": 123,
                "ownerId": 123,
                "message": "Alert assigned to me!"
            }
        }
    ]
}
```
