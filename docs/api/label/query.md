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
`fields`            | _all fields_      | Fields to return _(see fields below for all available fields)_.

### Fields
Field               | Return type   | Description
--------------------|---------------|-------------
`id`                | int           | Label Id.
`name`              | string        | Label name.
`color`             | string        | One of `Steel`, `Olive`, `Mauve`, `Emerald`, `Orange`, `Magenta` or `InfraSonarBlue`.
`description`       | string        | Label description.
`owner`             | object        | Container object with `id` and `name`.

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
