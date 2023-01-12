# Query check data
**`GET` /asset/<assetId\>/collector/<collectorKey\>/check/<checkKey\>?fmt=false**

### Description
Query check data. The result might be `null` when both the _collector_ and _check_ exist, but no data for the given _asset_ exists. If only the _framework_ is `null`, then the _check_ is enabled for the _asset_ but no data is received _(yet)_.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.
`collectorKey`      | Collector key.
`checkKey`          | Check key.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fmt`               | `false`           | Either `true` or `false`. When `true` the display function is used to format the values and if `false`, the raw values are returned.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Invalid value for _fmt_ query param.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Asset, collector or check not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/asset/123/collector/ping/check/ping?fmt=true' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "data": {
        "icmp": [
            {
                "address": "192.168.1.2",
                "maxTime": "1 ms",
                "name": "ping",
                "count": "5",
                "dropped": "0",
                "minTime": "165 μs"
            }
        ]
    },
    "framework": {
        "duration": "4.015 seconds",
        "timestamp": "2023-01-12 15:29:37+01:00",
        "prev": {
            "timestamp": "2023-01-12 15:24:37+01:00"
        }
    }
}
```

_In this example, "**ping**" is a collector, "**ping**" a check, "**icmp**" a type and "**name**", **address**, **maxTime** etc, are the metrics._