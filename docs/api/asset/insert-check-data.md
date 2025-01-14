# Insert check data
**`POST` /asset/<assetId\>/collector/<collectorKey\>/check/<checkKey\>**

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
`data`      | object    | No        | Object with check data _(if not given, `error` must be provided)_.
`version`   | string    | Yes       | Version of the collector.
`runtime`   | float     | No        | Time it took for the check to run in seconds.
`no_count`  | boolean   | No        | If `true`, the check result will not be _"counted"_ by InfraSonar and therefore _not_ affect _"last-seen"_.
`timestamp` | integer   | No        | Unix timestamp in seconds. If omitted, InfraSonar will set the timestamp for the check data.
`error`     | object    | No        | Object with error _(see [error](#error))_ _(if not given, `error` must be provided)_.

> At least one of `data` or `error` must be provided, and both can be included.

### Error

An optional error might be provided which raises a check notification in InfraSonar. It is possible send both _data_ and an _error_.

Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`severity`  | string    | No        | Severity of the error _(`LOW`, `MEDIUM` or `HIGH`)_.
`message`   | string    | Yes       | Error message

Example error object:

```json
{
    "severity": "MEDIUM",
    "message": "this is an example error message"
}
```

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`INSERT_CHECK_DATA`)_.
`404`       | Asset, collector or check not found.
`409`       | Collector is not assigned to the asset.
`413`       | Body size too large _(maximum 500 KB)_.

### Example
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/asset/123/collector/docker/check/network' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "data": {
        "networks": [
            {
                "name": "myNetwork",
                "ipAddress": "1.2.3.4"
            }
        ]
    },
    "version": "0.1.0"
}'
```
_In this example, "**docker**" is the collector, "**network**" the check, "**networks**" a type, "**name**" is a required metric and "**ipAddress**" is a metric._