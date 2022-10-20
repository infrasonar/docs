# `POST` /api/cwm/del-company

## Description

Remove a CWM company mapping.

## Arguments

| key             | value          | description                    |
| --------------- | -------------- | ------------------------------ |
| environmentUuid | str (required) | An InfraSonar environment uuid. |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec"
}
```

## Example curl

```bash
curl --location --request POST 'https://api.infrasonar.com/api/cwm/del-company' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec"
}'
```
