# Add message to alert
**`PUT` /alert/<alertKs\>/message**

### Description
Add a message to an open alert. Success _(204)_ is also returned when the alert does not exist.

### Path parameters
Param               | Description
--------------------|-------------
`alertKs`           | Alert key string _(ks)_.

### Body
Param           | Type      | Required  | Description
----------------|-----------|-----------|-------------
`message`       | string    | Yes       | Message to add _(max 240 characters, default empty)_.

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
    -X PUT 'https://api.infrasonar.com/alert/xxx/message' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "message": "This is an example message."
}'
```
