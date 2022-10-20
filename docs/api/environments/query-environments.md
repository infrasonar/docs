# `POST` /api/environments

## Description

Query for environments.

## Arguments

| key              | value            | description                                                        |
| ---------------- | ---------------- | ------------------------------------------------------------------ |
| columns          | array (required) | An array with host properties. See "Columns" for more information. |


## Columns

| key             | description                                                            |
| --------------- | ---------------------------------------------------------------------- |
| environmentUuid | The environment uuid.                                                  |
| name            | The name of the environment.                                           |
| cwmCompanyId    | ConnectWise Manage Company Id or `null` if no company Id is available. |
| hostCount       | Number of hosts in this environment.                                   |

## Example body (JSON)

```json
{
  "columns": ["environmentUuid", "name", "cwmCompanyId", "hostCount"]
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/environments' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "columns": [
    "environmentUuid",
    "name",
    "cwmCompanyId",
    "hostCount"
  ]
}'
```
