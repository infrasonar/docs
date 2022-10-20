# `POST` /api/cwm/set-board-id

## Description

Set a CWM ticket board id.

## Arguments

| key     | value          | description            |
| ------- | -------------- | ---------------------- |
| boardId | str (required) | A CWM ticket board id. |

## Example body (JSON)

```json
{
  "boardId": 22
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/cwm/set-board-id' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
"boardId": 22
}'
```
