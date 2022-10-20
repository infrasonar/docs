# `POST` /api/host/add

## Description

Add a host to Oversight.

## Arguments

| key             | value          | description                                      |
| --------------- | -------------- | ------------------------------------------------ |
| environmentUuid | str (required) | An environment uuid.                             |
| parentUuid      | str (required) | A parent uuid.                                   |
| address         | str (required) | The host address.                                |
| name            | str            | The name of the host which is used in Oversight. |
| description     | str            | A description that will be used in Oversight.    |
| reason          | str            | An audit logging message.                        |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "parentUuid": "a20224c219ec-0b91ee4ec7bb",
  "name": "host name",
  "address": "localhost"
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/host/add' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec",
  "parentUuid": "a20224c219ec-0b91ee4ec7bb",
  "name": "host name",
  "address": "localhost"
}'
```
