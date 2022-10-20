# `POST` /api/alerts

## Description

Query for alerts.

## Arguments

| key              | value            | description                               |
| ---------------- | ---------------- | ----------------------------------------- |
| environmentUuids | array (required) | An array with environment uuids.             |
| columns          | array (required) | An array with alert properties. See "Columns" for more information. |

## Columns

| key       | description      |
| --------- | ---------------- |
| ks        | An alert key-string. |
| status    |
| hostUuid  |
| itemName  |
| severity  |
| owner     |
| timestamp |

## Example body (JSON)

```json
{
  "environmentUuids": ["a20224c219ec"],
  "columns": ["timestamp", "status", "message"]
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/alerts' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuids": [
    "a20224c219ec"
  ],
  "columns": [
    "timestamp",
    "status",
    "message"
  ]
}'
```
