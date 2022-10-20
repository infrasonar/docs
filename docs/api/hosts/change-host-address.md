# `POST` /api/host/address

## Description

Change the address of a host.

## Arguments

| key             | value          | description               |
| --------------- | -------------- | ------------------------- |
| environmentUuid | str (required) | The environment uuid.     |
| hostUuid        | str (required) | The host uuid.            |
| address         | str (required) | The new host address.     |
| reason          | str            | An audit logging message. |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "address": "localhost"
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/host/address' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "address": "localhost"
}'
```
