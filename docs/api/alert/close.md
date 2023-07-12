# Close alert
**`POST`/alert/<alertKs\>/close**

### Description
Close an alert. An optional message can be provided. Success _(204)_ is also returned when the alert is already closed .


### Path parameters
Param               | Description
--------------------|-------------
`alertKs`           | Alert key string _(ks)_.

### Body
Param       | Type      | Required  | Description
------------|-----------|-----------|-------------
`message`   | string    | No        | Optional message _(max 240 characters, default empty)_.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body or alert key string.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ALERT_CHANGE`)_.

### Example
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/alert/xxx/close' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "message": "Closed using the API"
}'
```
