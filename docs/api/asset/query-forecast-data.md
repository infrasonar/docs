# Query forecast data

`GET /asset/<assetId>/collector/<collectorKey>/check/<checkKey>/type/<typeKey>/metric/<metricKey>/forecasts?aggregation=none`

### Description
Query forecast data. A list will be returned containing all items with forecasts. The forecast for each item is an array with arrays containing a _UNIX-timestamp_, the _upper_ and _lower_ prediction values. The forecast for an item might also be `null` when the forecast could not be created _(for example when the metric hasn't enough data points)_. In the latter case, the item has a `retryAfter` property with a UNIX-timestamp which tells when a new attempt will be made to create a forecast for that item.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.
`collectorKey`      | Collector key.
`checkKey`          | Check key.
`typeKey`           | Type key.
`metricKey`         | Metric key.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`aggregation`       | `none`            | One of `none`, `diff`, `diffps`, `first`, `last`, `count`, `mode`, `min`, `max`, `sum`, `mean`, `median`, `medianlow`, `medianhigh`. If you are not sure, just use the default `none`.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Invalid value for _aggregation_ query param.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Asset, collector, check, type or metric not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/asset/123/collector/wmi/check/system/type/processorTotal/metric/PercentProcessorTime/forecasts' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "name": "foo.local",
        "forecast": null,
        "retryAfter": 1684891252.3467717
    },
    {
        "name": "bar.local",
        "forecast": [
            [
                1684823400,
                5.443413461856282,
                0.3348468724474909
            ],
            [
                1684825200,
                5.339250050203838,
                0.46790794525554347
            ]
        ]
    }
]
```
