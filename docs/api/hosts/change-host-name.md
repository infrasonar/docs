# `POST` /api/host/name

## Description

Change the name of a host which is used in InfraSonar.

## Arguments

| key             | value          | description                                            |
| --------------- | -------------- | ------------------------------------------------------ |
| environmentUuid | str (required) | The environment uuid.                                  |
| hostUuid        | str (required) | The host uuid.                                         |
| name            | str (required) | The name of the host which will be used in InfraSonar. |
| reason          | str            | An audit logging message.                              |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "name": "host name"
}
```

## Example curl

```bash
curl --location --request POST 'https://api.infrasonar.com/host/name' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "name": "host name"
}'
```
