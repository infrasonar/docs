# `GET` /api/tasks

## Description

Get the user tasks.

## Example curl

```bash
curl --location --request GET 'https://oversig.ht/api/tasks' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```


Example Output:

```json
[
    {
        "id": 1234,
        "api": "/api/host/label/add",
        "user": 12,
        "message": "Add maintenance label to MYHOST",
        "schedule": null,
        "timestamp": 1633969452
    }
]
```
