# Query container
**`GET` /container/<containerId\>?fields=...**

### Description
Query container details.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see fields below for all available fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`id`                | integer       | Container Id.
`name`              | string        | Container name.
`timezone`          | string        | Container time-zone.
`mode`              | string        | One of `normal`, `maintenance` or `disabled`.
`properties`        | array(object) | List with property object. Each property container a `key` and `value` property.


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
    -X GET 'https://api.infrasonar.com/container/123' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "id": 123,
    "mode": "normal",
    "name": "My Container",
    "timezone": "Europe/Amsterdam",
    "properties": [{
        "key": "myProp",
        "value": null
    }]
}
```
