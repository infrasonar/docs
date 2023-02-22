# Query time series
**`POST` /asset/<assetId\>/query-time-series**

### Description
Query time series.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.

### Body
Param           | Type              | Required  | Description
----------------|-------------------|-----------|-------------
`collector`     | string            | Yes       | Collector key.
`check`         | string            | Yes       | Check key.
`type`          | string            | Yes       | Type key.
`metric`        | string            | Yes       | Metric key.
`items`         | array(string)     | No        | Item names. If not given, all items are returned.
`timeSpan`      | integer           | No        | Time span in seconds. Defaults to `28800` _(8 hours)_. The maximum time span is `2419200` _(28 days)_.
`start`         | integer/string    | No        | Unix timestamp or ISO time string. The _start_ + _time-span_ is the _end_ of the time window. When not given, the _start_ is calculated as _now_ minus the _time span_ which results in the latest data points.
`aggregation`   | object            | No        | See [aggregation section](#aggregation). If not given, no aggregation is used.
`merge`         | object            | No        | See [merge section](#merge). If not given, items are not merged.

#### Merge
Param           | Type      | Required  | Description
----------------|-----------|-----------|-------------
`as`            | string    | Yes       | Name as the time-series will be returned in the result. Only alpha-numeric characters and underscores are allowed and the name must not be empty.
`aggregation`   | object    | Yes       | See [aggregation section](#aggregation). This aggregation is used for merging the time series.

#### Aggregation
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`type`      | string    | Yes       | One of `mean`, `min`, `max`, `sum`, `median`, `median_high`, `median_low` or `count`.
`timeSpan`  | integer   | Yes       | Time span in seconds used for aggregation blocks. For example `3600` will create per-hour blocks.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Asset not found.

### Example
Curl request _(Average bytes received p/s per hour for the last 12 hours)_:
```bash
curl \
    -X POST 'https://api.infrasonar.com/asset/123/query-time-series' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \```
    --data-raw '{
    "collector": "wmi",
    "check": "network",
    "type": "interface",
    "metric": "BytesReceivedPersec",
    "timeSpan": 43200,
    "aggregation": {
        "type": "mean",
        "timeSpan": 3600
    }
}'
```

Response _(Each key in the response represents an item name, unless "merge" is used. The value is an array with with arrays containing a timestamp and value)_:
```json
{
    "Intel...": [
        [.., ..],
        [.., ..]
    ]
}
```
