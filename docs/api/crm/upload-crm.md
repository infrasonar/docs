# `POST` /api/crm/upload

## Description

Upload a CRM.

## Arguments

| key       | value             | description |
| --------- | ----------------- | ----------- |
| customers | object (required) | task id     |
| employees | object (required) | task id     |
| subjects  | array (required)  | task id     |

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/crm/upload' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'
```
