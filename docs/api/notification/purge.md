# Purge notification
**`PUT` /notification/<notificationKs\>/purge**

### Description
Close a notification. Success _(204)_ is also returned when the notificiation is already closed .


### Path parameters
Param               | Description
--------------------|-------------
`notificationKs`    | Notification key string _(ks)_.

### Body
Param           | Type      | Required  | Description
----------------|-----------|-----------|-------------
`userId`        | integer   | No        | Optional User Id. When not given the notification will be closed by the token' user in case of a user token.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body or notification key string.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ASSET_MANAGEMENT`+`CONTAINER_MANAGERMENT`+`CONTAINER_ADMIN`)_.

### Example
Curl request:
```bash
curl \
    -X PUT 'https://api.infrasonar.com/notification/xxx/purge' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "message": "Closed using the API"
}'
```
