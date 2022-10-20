# `POST` /api/cwm/set-ticket-status

## Description

Set a CWM ticket status name.

## Arguments

| key          | value          | description               |
| ------------ | -------------- | ------------------------- |
| ticketStatus | str (required) | A CWM ticket status name. |

## Example body (JSON)

```json
{
  "ticketStatus": "New"
}
```

## Example curl

```bash
curl --location --request POST 'https://oversig.ht/api/cwm/set-ticket-status' \
--header 'Content-Type: application/json' \
--header 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
--data-raw '{
  "ticketStatus": "New"
}'
```
