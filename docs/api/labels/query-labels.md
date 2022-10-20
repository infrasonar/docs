# `POST` /api/labels

## Description

Query for labels.

## Arguments

| key              | value            | description                                                        |
| ---------------- | ---------------- | ------------------------------------------------------------------ |
| environmentUuids | array (required) | An array with environment uuids.                                   |
| columns          | array (required) | An array with host properties. See "Columns" for more information. |


## Columns

| key         | description                                      |
| ----------- | ------------------------------------------------ |
| name        | Label name.                                      |
| ks          | Key string of the label.                         |
| environment | Environment where the label is created. With a uuid (`environmentUuid`) and `name` property. |
| description | Description of the label.                        |

## Example body (JSON)

```json
{
  "environmentUuids": ["a20224c219ec"],
  "columns": ["name", "ks", "description"]
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/labels' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuids": [
    "a20224c219ec"
  ],
  "columns": [
    "name",
    "ks",
    "description"
  ]
}'
```
