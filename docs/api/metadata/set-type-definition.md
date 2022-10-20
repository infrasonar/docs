# `POST` /api/metadata/set-typeinfo

## Description

Set the definition of a type.

!!! warning
    When the type definition already exists, it will be overwritten.

## Arguments

| key     | value            | description                                                 |
| ------- | ---------------- | ----------------------------------------------------------- |
| probe   | str (required)   | The probe name. Name must start with a letter, followed by alpha-numeric characters and/or underscores (`A-z`, `0-9`, and `_`). Probe names must always end with `Probe`, for example: `myProbe`.  |
| check   | str (required)   | The check name. Name must start with a letter, followed by alpha-numeric characters and/or underscores (`A-z`, `0-9`, and `_`). |
| type    | str (required)   | The type name. Name must start with a letter, followed by alpha-numeric characters and/or underscores (`A-z`, `0-9`, and `_`). |
| metrics | array (required) | The metric definitions. See [Metrics](#metrics) for more information. |

## Metrics

| key      | value          | description                                   |
| -------- | -------------- | --------------------------------------------- |
| name     | str (required) | The metric name.                              |
| dataType | str (required) | The metric data type (`bool`, `int`, `float`, `str`). |
| required | bool (optional)| Determines if the metric is required. Default: `false` |

!!! info
    Data type `int` will be handled as a **64bit** integer.

A metric name must start with a letter, followed by alpha-numeric characters and/or underscores (`A-z`, `0-9`, and `_`).

At least the metric `name` with dataType `str` is required. For example:

```json
"metrics": [
  {
    "name": "name",
    "dataType": "str"
  }
]
```

## Example body (JSON)

```json
{
  "probe": "myProbe",
  "check": "myCheck",
  "type": "myType",
  "metrics": [
    {
      "name": "name",
      "dataType": "str"
    },
    {
      "name": "myMetric",
      "dataType": "int",
      "required": true
    },
    {
      "name": "otherMetric",
      "dataType": "int"
    }
  ]
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/metadata/set-typeinfo' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "probe": "myProbe",
  "check": "myCheck",
  "type": "myType",
  "metrics": [
    {
      "name": "name",
      "dataType": "str"
    },
    {
      "name": "myMetric",
      "dataType": "int",
      "required": true
    },
    {
      "name": "otherMetric",
      "dataType": "int"
    }
  ]
}'
```
