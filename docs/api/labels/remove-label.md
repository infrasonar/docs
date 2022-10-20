# `POST` /api/label/remove

## Description

Remove a label.

## Arguments

| key             | value          | description               |
| --------------- | -------------- | ------------------------- |
| environmentUuid | str (required) | The environment uuid.     |
| label           | str (required) | The label key-string.     |
| reason          | str            | An audit logging message. |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "label": "agxzfm92ZXItc2lnaHRyJAsSCEN1c3RvbWVyIghzeXNhZG1pbgwLEgVMYWJlbBixip4BDA"
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/label/remove' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec",
  "label": "agxzfm92ZXItc2lnaHRyJAsSCEN1c3RvbWVyIghzeXNhZG1pbgwLEgVMYWJlbBixip4BDA"
}'
```
