# Query asset alerts
**`GET` /asset/<assetId\>/collector/<collectorKey\>/check/<checkKey\>?raw=false**

### Description
Query check data. The result always contains a framework. Both data and the framework may be `null` when no state data is found.

### Path parameters
Param               | Description
--------------------|-------------
`assetId`           | Asset Id.
`collectorKey`      | Collector key.
`checkKey`          | Check key.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`raw`               | `false`           | Either `true` or `false`. When `false` the display function is used to format the values and if `true`, the raw values are returned.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Invalid value for _raw_ query param.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Asset, collector or check not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/asset/123/collector/docker/check/network' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "data": {
        "networks": [
            {
                "name": "myNetwork",
                "ipAddress": "1.2.3.4"
            }
        ]
    },
    "framework": {
        "timestamp": 1667511469
    }
}
```

_In this example, "**docker**" is the collector, "**network**" the check, "**networks**" a type, "**name**" is a required metric and "**ipAddress**" is a metric._