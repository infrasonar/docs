# `POST` /api/label/add

## Description

Add a label.

## Arguments

| key             | value          | description               |
| --------------- | -------------- | ------------------------- |
| environmentUuid | str (required) | The environment uuid.     |
| name            | str (required) | The label name.           |
| description     | str            | The label description.    |
| reason          | str            | An audit logging message. |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "name": "label name"
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/label/add' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec",
  "name": "label name"
}'
```
