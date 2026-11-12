# List available reporting kinds:
**`GET` /reporting/kinds**

### Description
Returns a list of supported reporting kind names.

See the [Kinds](#kinds) table below for the currently supported asset kinds. Use this endpoint to dynamically fetch the up-to-date list of available kinds, as new reporting kinds may be introduced in future releases.

### Kinds
Name                        | Description
----------------------------|-------------
`AgentcoresProbesReport`    | This report provides an overview of agentcores within selected containers. It includes container and agentcore identifiers, connection status (agentcore and RAPP), agentcore version, and installed probe versions (where applicable).
`AlertsNotificationsReport` | This report provides alert and notification data for a specified time period. It can be formatted as a PDF with charts for visual analysis or as an XLSX/JSON overview of open alerts and notifications.
`ChartDataReport`           | This report generates a PDF-document with charts for a selection of assets.
`CheckStatusReport`         | This reports show the status for a collector/check for a selection of assets.
`ConditionReport`           | This reports shows when and how many time a condition is being hit within a selected time period.
`ConditionStatusReport`     | This reports show the status for a condition (like the effective condition page) for a selection of assets.
`GuestsReport`              | This report contains all guests of the selected parent combined with assets running the guest collector.
`PhoneUsageReport`          | This report contains charts for phone usage within a selected time period.
`StateDataReport`           | This report shows data for a collector/check/type for a selection of assets.
`UserPermissionsReport`     | This report lists all user permissions for the selected containers.

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
