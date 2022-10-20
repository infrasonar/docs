# `POST` /api/host/uptime

## Description

Returns the up-time of a host in seconds.

## Arguments

| key             | value          | description           |
| --------------- | -------------- | --------------------- |
| environmentUuid | str (required) | The environment uuid. |
| hostUuid        | str (required) | The parent uuid.      |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb"
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/host/uptime' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
"environmentUuid": "a20224c219ec",
"hostUuid": "a20224c219ec-0b91ee4ec7bb"
}'
```
