![Webhooks](../images/webhooks.png){ width="150" align=right}

# Webhooks

Webhooks can be used to inform third party services about open en closed alerts and notifications. A webhook must be used by a [rule](./rules.md) before the webhook will be executed. This enables more control for when a webhook must be called.


## Variable in a webhook

It is possible to use variable using the syntax `{{ variable }}` when creating a webhook. The following variable are available:

Variable                    | Scope         | Example value
--------------------------- | ------------- | -------------
`alert_link`                | Alert         | https://app.infrasonar.com/container/123/asset/456/alert?condition=789&item=myitem&alert=1689146219
`alert_message`             | Alert         | A message with optional MarDown syntax.
`alert_severity`            | Alert         | WARNING _(One of `EMERGENCY`, `ALERT`, `CRITICAL`, `ERROR`, `WARNING`, `NOTICE`, `INFORMATIONAL` or `DEBUG`)_
`alert_timestamp`           | Alert         | 1689146219
`asset_id`                  | Alert         | 456
`asset_name`                | Alert         | My asset
`condition_id`              | Alert         | 789
`condition_name`            | Alert         | My condition
`container_id`              | All           | 123
`container_link`            | All           | https://app.infrasonar.com/container/123
`container_name`            | All           | My container
`item_name`                 | Alert         | My item
`ks`                        | All           | _(Unique key string to identify the alert of notification)_
`notification_identifier`   | Notification  | _(For example an asset name but can be nil)_
`notification_index`        | Notification  | _(For example a check name but can be nil)_
`notification_kind`         | Notification  | ConnectionStatus _(One of `ConnectionStatus`, `ConnectionTimeDelta`, `ProbeVersion`, `ProbeMissing`, `ProbeTimeDelta`, `ProbeNoHeartbeat`, `CheckMissing`, `CheckError`, `CheckAged`, `CheckInvalidResult`, `CheckInvalidTimestamp`, `CheckInvalidData`, `ContainerMaintenance`, `AgentcoreMissing` or `ConditionError`)_
`notification_message`      | Notification  | A message with optional MarkDown syntax.
`notification_severity`     | Notification  | MEDIUM _(One of `LOW`, `MEDIUM` or `HIGH`)_
`notification_timestamp`    | Notification  | 1689146219
`webhook_id`                | All           | 0 _(Webhook identifier)_
`webhook_name`              | All           | My webhook
`scope`                     | All           | AlertOpen _(One of `AlertOpen`, `AlertClose`, `NotificationOpen` or `NotificationClose`)_
