# `POST` /api/cwm/set-company

## Description

Set a CWM company mapping.

## Arguments

| key             | value          | description                |
| --------------- | -------------- | -------------------------- |
| environmentUuid | str (required) | An Oversight environment uuid. |
| companyId       | int (required) | A CWM ticket company id.      |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "companyId": 1
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/cwm/set-company' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec",
  "companyId": 1
}'
```
