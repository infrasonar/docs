# `POST` /api/label/name

## Description

Change the name of a label.

## Arguments

| key             | value          | description               |
| --------------- | -------------- | ------------------------- |
| environmentUuid | str (required) | The environment uuid.     |
| label           | str (required) | The label key-string.     |
| name            | str (required) | The new label name.       |
| reason          | str            | An audit logging message. |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "label": "agxzfm92ZXItc2lnaHRyJAsSCEN1c3RvbWVyIghzeXNhZG1pbgwLEgVMYWJlbBixip4BDA",
  "name": "label name"
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/label/name' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec",
  "label": "agxzfm92ZXItc2lnaHRyJAsSCEN1c3RvbWVyIghzeXNhZG1pbgwLEgVMYWJlbBixip4BDA",
  "name": "label name"
}'
```
