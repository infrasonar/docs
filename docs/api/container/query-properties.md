# Query container properties
**`GET` /container/<containerId\>/properties?kind=...&id=...&fields=...**

### Description
Query all properties for a given container.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
Param       | Default       | Description
------------|---------------|-------------
`fields`    | _all fields_  | Fields to return _(see fields below for all available fields)_.
`kind`      | _none_        | Only properties for a specific kind. One of `Asset`, `Container`, `Condition` or `User`.
`id`        | _none_        | Only properties for a given Id.

### Fields
Field               | Return type       | Description
--------------------|-------------------|-------------
`id`                | int               | Target Id for the property.
`kind`              | string/null       | Target Kind of the property. One of `Asset`, `Container`, `Condition`, `User` or `null` if no target is found.
`name`              | string/null       | Readable name for the target. This value can be `null` if no target is found for the Id.
`key`               | string            | Property key.
`value`             | any               | Property value.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field or invalid query param.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/container/123/properties?id=123' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "id": 123,
        "kind": "Asset",
        "name": "my-host",
        "key": "alt_client_id",
        "value": 456
    }
]
```
