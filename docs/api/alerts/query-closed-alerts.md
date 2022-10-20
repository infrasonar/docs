# `POST` /api/alerts/closed

## Description

Query for closed alerts.

## Arguments

| key             | value            | description                                                         |
| --------------- | ---------------- | ------------------------------------------------------------------- |
| environmentUuid | str (required)   | An environment uuid.                                                |
| hostUuids       | array (required) | An array with hostuuids.                                            |
| startTs         | int (required)   | A unix timestamp.                                                   |
| endTs           | int (required)   | A unix timestamp.                                                   |
| columns         | array (required) | An array with alert properties. See "Columns" for more information. |

## Columns

| key       | description      |
| --------- | ---------------- |
| ks        | AN alert key-string. |
| status    |
| hostUuid  |
| itemName  |
| severity  |
| owner     |
| timestamp |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "hostUuids": ["a20224c219ec-0b91ee4ec7bb"],
  "columns": ["timestamp", "status", "message"],
  "startTs": 1573200000,
  "endTs": 1573300000
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/alerts/closed' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "environmentUuid": "a20224c219ec",
  "hostUuids": [
    "a20224c219ec-0b91ee4ec7bb"
  ],
  "columns": [
    "timestamp",
    "status",
    "message"
  ],
  "startTs": 1573200000,
  "endTs": 1573300000
}'
```
