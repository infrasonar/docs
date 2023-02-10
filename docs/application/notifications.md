![Notifications](../images/application_notifications.png){ width="200" align=right}

# Notifications

Notification are used to notify InfraSonar users of issues with the monitoring platform.

Notifications offer a clear distinction between actual "Alerts" and when monitoring is failing.

Notifications auto-close when the issue is resolved, users can't close a notification only the system can once the issue is resolved. 
As such all notifications should be handled as an indication that something is wrong with monitoring.

!!! tip "Good to known"
    Notifications are not the result of a condition. The only notifications which are raised by incoming data, are the check errors. These are not conditions but errors which directly result in a notification.
