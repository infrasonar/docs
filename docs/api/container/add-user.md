# Add user to container
**`POST` /container/<containerId\>/user**

### Description
Add a user to the container. This only works for existing InfraSonar users. If you want to add a new user, use the [create invite](./create-invite.md) API.
An error will be returned if the user already is added to the container. Use [update user](./update-user.md) to update user permissions.

### Path parameters
Param               | Description
--------------------|-------------
`containerId`       | Container Id.

### Query parameters
_none_

### Body
Param           | Type          | Required  | Description
----------------|---------------|-----------|-------------
`email`         | string        | Yes       | Email for the user.
`authProvider`  | string        | Yes(*)    | Authentication provider for the user. One of `Google`, `Microsoft` or `Password` _(only required when a duplicated email address exists)_.
`member`        | boolean       | No        | When `true`, the user will be marked as a member. Alerts can only be assigned to members of the container. Defaults to `false`.
`permissions`   | array(string) | No        | Optional list with user permissions (see: [authentication flags](#authentication-flags) for a complete list).

### Authentication flags

Auth Flag | Description
--------- | -----------
`READ` | Required to view the container.
`ALERT_ASSIGN` | Required for assigning alerts.
`ALERT_CHANGE` | Required for adding comment to alerts and for closing alerts.
`API` | Required making API calls to this container.
`ASSET_MANAGEMENT` | Required for asset management tasks such as creating new assets, label assignments, changing the asset mode etc.
`BILLING` | Required for viewing the `credits` tab on a container.
`CHECK_MANAGEMENT` | Required to enable or disable checks and change a check interval.
`CONTAINER_ACCESS` | Required for adding users to a container and managing their access rights.
`CONTAINER_ADMIN` | Required to make, change, or delete labels and conditions, and to enable or disable collectors.
`CONTAINER_MANAGEMENT` | Required for renaming or moving the container and also for creating child containers.
`CONTAINER_TOKENS` | Required for adding container tokens and managing their access rights.
`CORE_CONNECT` | Required for Agentcores to connect to the InfraSonar hub.
`INSERT_CHECK_DATA` | Required to insert check-data with the API. This is required for agents to write data.
`PURGE_TIME_SERIES` | Required to purge dead time-series.
`REPORTING_ADMIN` | Required for making, changing or deleting report configurations.
`REPORTING_VIEW` | Required to open reporting and download reports.
`RULE_EMAIL` | Required for adding your own alert or notification rule using email. This flag is also required for App rules.
`RULE_MANAGEMENT` | Required for managing any kind of rule. This also allows to view and edit rules from other users.
`RULE_PHONE` | Required for adding your own alert or notification rule using SMS, VoiceCall or WhatsApp.
`TIME_SERIES_MANAGEMENT` | Required to enable or disable SiriDB time-series.
`VIEW_LOG` | Required to view the logs.
`WEBHOOKS` | Required for making, changing or deleting webhooks.

### Return codes
Error code  | Reason
------------|--------
`204`       | Success.
`400`       | Invalid body or the user already exists on the container.
`401`       | Invalid or missing token.
`403`       | Insufficient permissions _(required: `API`+`CONTAINER_ACCESS`)_.
`404`       | Container not found.

### Example
Curl request:
```bash
curl \
    -X POST 'https://api.infrasonar.com/container/123/user' \
    -H 'Authorization: Bearer XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' \
    -H 'Content-Type: application/json' \
    --data-raw '{
    "email": "alice@wonderland.net",
    "authProvider": "Password",
    "member": true,
    "permissions": ["READ"]
}'
```
