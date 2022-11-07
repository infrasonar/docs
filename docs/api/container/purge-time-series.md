# Purge time-series
**`POST` /container/<containerId\>/purge-time-series**

### Description
Purge dead time-series. Time series are considered _dead_ if they didn't got any new data for a period of time. This period must be given in weeks.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`weeks`     | integer   | Yes       | Integer value between 1 and 999 _(**recommended:** 5 weeks or more)_.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`PURGE_TIME_SERIES`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/container/123/purge-time-series' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "weeks": 5
}'
```

Response:
```json
{
    "purgedTimeSeries": 12345
}
```
