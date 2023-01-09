# Query container assets
**`GET` /container/<containerId\>/assets?fields=...**

### Description
Query all assets for a given container. _(removed assets are not included)_.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
Param               | Default           | Description
--------------------|-------------------|-------------
`fields`            | `id`              | Fields to return _(see fields below for all available fields)_.
`collectors`        | _none_            | Collector fields. If at least one field is given, the result will include "_collectors_" with an array of _collector_ objects _(see Collectors below for all available collector fields)_.
`kind`              | _none_            | Only assets with the given kind _(e.g kind=Windows)_.
`not-kind`          | _none_            | Only assets with another kind than the given kind _(e.g not-kind=Asset)_.
`mode`              | _none_            | Only assets with the given mode _(e.g mode=normal)_.
`not-mode`          | _none_            | Only assets with another mode than the given mode _(e.g not-mode=disabled)_.
`collector`         | _none_            | Only assets with the given collector _(e.g collector=tcp)_.
`not-collector`     | _none_            | Only assets without the given collector _(e.g not-collector=wmi)_.
`label`             | _none_            | Only assets with the given label Id _(e.g label=123)_.
`not-label`         | _none_            | Only assets without the given label Id _(e.g not-label=456)_.

### Fields
Field               | Return type       | Description
--------------------|-------------------|-------------
`id`                | integer           | Asset Id.
`container`         | integer           | Asset container Id _(Equal to containerId)_.
`name`              | string            | Asset name.
`kind`              | string            | One of the kinds _(see [set-kind](../asset/set-kind.md) api)_
`description`       | string            | Asset description.
`mode`              | string            | One of `normal`, `maintenance` or `disabled`.
`labels`            | array(integer)    | List with label Ids.

### Collectors
Collector field     | Return type   | Description
--------------------|---------------|-------------
`key`               | string        | Collector key.
`name`              | string        | Collector name.
`kind`              | string        | One of `agent`, `probe` or `service`.
`config`            | object/null   | Configuration for the collector if config exists.

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
    -X GET 'https://api.infrasonar.com/container/123/assets?fields=id,name,mode' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```

Response:
```json
[
    {
        "id": 123,
        "name": "my-host.local",
        "mode": "normal"
    }
]
```
