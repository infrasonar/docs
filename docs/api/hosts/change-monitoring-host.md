# `POST` /api/host/parent

## Description

Change the monitoring host.

## Arguments

| key             | value          | description               |
| --------------- | -------------- | ------------------------- |
| environmentUuid | str (required) | The environment uuid.     |
| hostUuid        | str (required) | The host uuid.            |
| parentUuid      | str (required) | A parent uuid.            |
| reason          | str            | An audit logging message. |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "parentUuid": "a20224c219ec-0b91ee4ec7bb"
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/host/parent' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "parentUuid": "a20224c219ec-0b91ee4ec7bb"
}'
```
