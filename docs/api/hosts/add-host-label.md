# `POST` /api/host/label/add

## Description

Add a label to a host.

## Arguments

| key             | value          | description               |
| --------------- | -------------- | ------------------------- |
| environmentUuid | str (required) | The environment uuid.     |
| hostUuid        | str (required) | The host uuid.            |
| label           | str (required) | A label key-string.       |
| reason          | str            | An audit logging message. |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "label": "agxzfm92ZXItc2lnaHRyJAsSCEN1c3RvbWVyIghzeXNhZG1pbgwLEgVMYWJlbBixip4BDA"
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/host/label/add' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "label": "agxzfm92ZXItc2lnaHRyJAsSCEN1c3RvbWVyIghzeXNhZG1pbgwLEgVMYWJlbBixip4BDA"
}'
```
