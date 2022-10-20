# `POST` /api/host/probe/remove

## Description

Remove a probe from a host.

## Arguments

| key             | value          | description               |
| --------------- | -------------- | ------------------------- |
| environmentUuid | str (required) | The environment uuid.     |
| hostUuid        | str (required) | The host uuid.            |
| probe           | str (required) |
| reason          | str            | An audit logging message. |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "probe": "snmpProbe"
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/host/probe/remove' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "probe": "snmpProbe"
}'
```
