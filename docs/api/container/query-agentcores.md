# Query container agentcores
**`GET` /container/<containerId\>/agentcores?fields=...**

### Description
Query all agentcores for a given container.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | `id`              | Fields to return _(see fields below for all available fields)_.
`probes`            | _none_            | Probes fields. If at least one field is given and the agentcore is connected, the result will include "_probes_" with an array of _probe_ objects _(see Probes below for all available probe fields)_.

### Fields
Field               | Return type       | Description
--------------------|-------------------|-------------
`id`                | integer           | Agentcore Id.
`name`              | string            | Agentcore name.
`zone`              | integer           | Agentcore zone Id.
`version`           | string/null       | Agentcore version. _(null if not connected)_
`connected`         | boolean           | True if the agentcore is connected.
`rappConnected`     | boolean           | True if RAPP (remote appliance) is connected.

### Probes
Probe field         | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Probe collector key.
`version`           | string        | Probe collector version.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/container/123/agentcores?fields=id,connected,rappConnected?probes=key,version' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "id": 123,
        "connected": true,
        "rappConnected": true,
        "probes": [
            {
                "key": "wmi",
                "version": "v3.0.17"
            }
        ]
    }
]
```
