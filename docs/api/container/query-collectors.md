# Query container collectors
**`GET` /container/<containerId\>/collectors?fields=...**

### Description
Query all collectors for a given container. _(only enabled collectors are included)_.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
Param       | Default   | Description
------------|-----------|-------------
`fields`    | `key`      | Fields to return _(see fields below for all available fields)_.
`options`   | _none_    | Option fields. If at least one field is given, the result will include "_options_" with an array of _option_ objects _(see Options below for all available option fields)_.

### Fields
Field               | Return type       | Description
--------------------|-------------------|-------------
`key`               | string            | Collector Id.
`name`              | string            | Collector name.
`kind`              | string            | One of `agent`, `probe` or `service`.
`info`              | string            | Collector info.
`min-version`       | string            | Minimal required version for the collector.

### Options
Option field     | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Option key.
`name`              | string        | Option name.
`info`              | string        | Option info.
`type`              | string        | One of `Bool`, `Int`, `Float`, `String`, `ListBool`, `ListInt`, `ListFloat` or `ListString`.
`default`           | any           | Default value _(The default value is not guaranteed to pass the validation function)_.

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
    -X GET 'https://api.infrasonar.com/container/123/collectors?fields=key,kind&options=key,type,default' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "key": "wmi",
        "kind": "probe",
        "options": [
            {
                "key": "address",
                "type": "String",
                "default": "",
            }
        ]
    }
]
```
