# `POST` /api/data/insert

## Description

Insert data into InfraSonar.

!!! note
    This API route has an alias `/api/data` which will be removed in a future version

## Arguments

| key             | value             | description                  |
| --------------- | ----------------- | ---------------------------- |
| environmentUuid | str (required)    | An environment uuid.         |
| hostUuid        | str (required)    | A host uuid.                 |
| probe           | str (required)    | A probe name.                |
| check           | str (required)    | A check name.                |
| data            | object (required) | Check data.                  |
| timestamp       | int               | A unix timestamp.            |
| runtime         | float             | A check duration in seconds. |


!!! Info
    Note that the `name` metric will be generated from the item name in case the `name` metric is not explicitly given. When you *do* provide the `name` metric, it **must** be equal the the key name.

    For example: `{"item-0": {"name": "item-0", "other": 123}}` is equal to `{"item-0": {"other": 123}}`.


## Example body (JSON)

```json
{
  "environmentUuid": "a20224c219ec",
  "hostUuid": "a20224c219ec-0b91ee4ec7bb",
  "probe": "myProbe",
  "check": "myCheck",
  "data": {
    "myType": {
      "item-0": {
        "myMetric": 0,
        "otherMetric": 42
      },
      "item-1": {
        "myMetric": 10,
        "ignoredMetric": null
      },
      "item-2": {
        "myMetric": 40
      }
    }
  }
}
```

When a metric value is null, the metric will be ignored.

## Example curl

```bash
curl --location --request POST 'https://api.infrasonar.com/data/insert' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
"environmentUuid": "a20224c219ec",
"hostUuid": "a20224c219ec-0b91ee4ec7bb",
"probe": "myProbe",
"check": "myCheck",
"data": {
"myType": {
"item-0": {
"myMetric": 0,
"otherMetric": 42
},
"item-1": {
"myMetric": 10,
"ignoredMetric": null
},
"item-2": {
"myMetric": 40
}
}
}
}'
```
