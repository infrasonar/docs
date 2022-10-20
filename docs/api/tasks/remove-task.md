# `POST` /api/task/remove

## Description

Remove a task.

## Arguments

| key    | value          | description  |
| ------ | -------------- | ------------ |
| taskId | str (required) | The task id. |

## Example body (JSON)

```json
{
  "taskId": 0
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/task/remove' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
"taskId": 0
}'
```
