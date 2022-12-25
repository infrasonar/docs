# Query alert
**`GET`/label/<labelId\>?fields=...**

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
`id`                | int           | Id of the label.
`name`              | string        | Name of the label.
`color`             | string        | Color used for the label.
`description`       | string        | Description for the label.


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
