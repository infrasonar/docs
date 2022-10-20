# `POST` /api/data/query

## Description

Query data from Oversight.

## Arguments

| key             | value             | description                  |
| --------------- | ----------------- | ---------------------------- |
| environmentUuid | str (required)    | An environment uuid.         |
| hostUuid        | str (required)    | A host uuid.                 |
| probe           | str (required)    | A probe name.                |
| check           | str (required)    | A check name.                |
| type            | str (required)    | A type name.                 |
| metrics         | array (optional)  | List of metric. When `null` or omitted, all metrics will be returned  |

## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "probe": "myProbe",
  "check": "myCheck",
  "type": "myType",
  "metrics": ["myMetric1", "myMetric2"]
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/data/query' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
"environmentUuid": "a20224c219ec",
"hostUuid": "a20224c219ec-0b91ee4ec7bb",
"probe": "myProbe",
"check": "myCheck",
"type": "myType",
"metrics": ["myMetric1", "myMetric2"]
}'
```
