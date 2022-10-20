# `POST` /api/host/description

## Description

Change the description of a host.

## Arguments

| key             | value          | description                                      |
| --------------- | -------------- | ------------------------------------------------ |
| environmentUuid | str (required) | The environment uuid.                            |
| hostUuid        | str (required) | The host uuid.                                   |
| description     | str (required) | The description that will be used in InfraSonar. |
| reason          | str            | An audit logging message.                        |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "description": "host description"
}
```

## Example curl

```bash
curl --location --request POST 'https://api.infrasonar.com/host/description' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
"environmentUuid": "a20224c219ec",
"hostUuid": "a20224c219ec-0b91ee4ec7bb",
"description": "host description"
}'
```
