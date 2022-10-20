# `POST` /api/metadata/get-typeinfo

## Description

Get the definition of a type.

## Arguments

| key   | value          | description     |
| ----- | -------------- | --------------- |
| probe | str (required) | The probe name. |
| check | str (required) | The check name. |
| type  | str (required) | The type name.  |

## Example body (JSON)

```json
{
  "probe": "myProbe",
  "check": "myCheck",
  "type": "myType"
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/metadata/get-typeinfo' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "probe": "myProbe",
  "check": "myCheck",
  "type": "myType"
}'
```
