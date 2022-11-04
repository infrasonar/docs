# Insert check data
**`POST` /asset/<assetId\>/collector/<collectorKey/>/check/<checkKey/>/data**

### Description
Insert check data.

### Path parameters

Param               | Description
--------------------|-------------
`assetId`           | Asset Id.
`collectorKey`      | Collector key.
`checkKey`          | Check key.

### Query parameters

_none_

### Body

Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`data`      | object    | Yes       | Object with check data.
`runtime`   | float     | No        | Time in seconds.
`timestamp` | integer   | No        | Unix timestamp in seconds. If omitted, InfraSonar will set the timestamp for the check data.

### Return codes

Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`INSERT_CHECK_DATA`)_.
`404`       | AssetId or collectorKey or checkKey not found.


### Example
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/asset/123/collector/docker/check/network/data' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    --data-raw '{
    "data": {
        "networks": [
            {
                "name": "myNetwork",
                "ipAddress": "1.2.3.4"
            }
        ]
    }
}'
```
