# Query label
**`GET` /label/<labelId\>?fields=...**

### Description
Query label details.

### Path parameters
Param               | Description
--------------------|-------------
`labelId`           | Label Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | _all fields_      | Fields to return _(see [Fields](#fields) below for all available fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`id`                | integer       | Label Id.
`name`              | string        | Label name.
`color`             | string        | Label color. See [List available colors](./colors.md#colors) for all available colors.
`description`       | string        | Label description.
`ownerId`           | integer       | Container Id where the label is created.

### Return codes
Error code  | Reason
------------|--------
`200`       | Success.
`400`       | Unknown field.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`READ`)_.
`404`       | Label not found.

### Example
Curl request:
```bash
curl \
    -X GET 'https://api.infrasonar.com/label/123?fields=name,color' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
{
    "name": "windows",
    "color": "InfraSonarBlue"
}
```
