# Assign alert
**`PUT` /alert/<alertKs\>/assign**

### Description
Assign an open alert to a user. The user _(userId)_ must be marked as a member of the container. Success _(204)_ is also returned when the alert does not exist.

### Path parameters
Param               | Description
--------------------|-------------
`alertKs`           | Alert key string _(ks)_.

### Body
Param              | Type      | Required  | Description
-------------------|-----------|-----------|-------------
`userId`           | integer   | Yes       | User Id.
`assignedByUserId` | integer   | No        | Optional assigned by User Id. When not given the alert will be assigned by the token' user in case of a user token.
`message`          | string    | No        | Optional message _(max 240 characters, default empty)_.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body or alert key string.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`ALERT_ASSIGN`)_.
`404`       | User _(assignedByUserId)_, _(userId)_ not found or user _(userId)_ is not a member.

### Example
Curl request:
```bash
curl \
    -X PUT 'https://api.infrasonar.com/alert/xxx/assign' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "userId": 123
}'
```
