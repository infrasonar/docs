# `POST` /api/label/description

## Description

Change the description of a label.

## Arguments

| key             | value          | description                |
| --------------- | -------------- | -------------------------- |
| environmentUuid | str (required) | The environment uuid.      |
| label           | str (required) | The label key-string.      |
| description     | str (required) | The new label description. |
| reason          | str            | An audit logging message.  |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "label": "agxzfm92ZXItc2lnaHRyJAsSCEN1c3RvbWVyIghzeXNhZG1pbgwLEgVMYWJlbBixip4BDA",
  "description": "label description"
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/label/description' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec",
  "label": "agxzfm92ZXItc2lnaHRyJAsSCEN1c3RvbWVyIghzeXNhZG1pbgwLEgVMYWJlbBixip4BDA",
  "description": "label description"
}'
```
