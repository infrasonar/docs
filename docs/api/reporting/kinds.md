# List available reporting kinds:
**`GET` /reporting/kinds**

### Description
Returns a list of supported reporting kind names.

See the [Kinds](#kinds) table below for the currently supported asset kinds. Use this endpoint to dynamically fetch the up-to-date list of available kinds, as new reporting kinds may be introduced in future releases.

### Kinds
Name                        | Description
----------------------------|-------------
`AgentcoresProbesReport`    |
`AlertsNotificationsReport` |
`ChartDataReport`           |
`CheckStatusReport`         |
`ConditionReport`           |
`ConditionStatusReport`     |
`GuestsReport`              |
`PhoneUsageReport`          |
`StateDataReport`           |
`UserPermissionsReport`     |

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
    -X GET 'https://api.infrasonar.com/reporting/kinds' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
  "AgentcoresProbesReport",
  "AlertsNotificationsReport",
  "ChartDataReport",
  "CheckStatusReport",
  "ConditionReport",
  "ConditionStatusReport",
  "GuestsReport",
  "PhoneUsageReport",
  "StateDataReport",
  "UserPermissionsReport"
]
```
