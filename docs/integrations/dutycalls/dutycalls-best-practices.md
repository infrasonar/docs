# DutyCalls

We assume you have set up the DutyCalls integration as described [here](dutycalls-getting-started.md)

## InfraSonar configuration

Using the InfraSonar channel configuration, you can configure and finetune which alerts are passed on the DutyCalls.

Configuration is possible on these three levels:

* **Severity**, allows you to specify from which severity level an alert is passed to DutyCalls.
* **Conditions**, allows you to configure which conditions are allowed or are rejected to pass on to DutyCalls.
* **Hosts** allows you to configure for which hosts you want to receive DutyCalls notifications.

It is also possible to suppress specific conditions from sending an alert to DutyCalls.

!!! hint "Best practice."
    * Only send alerts with the severity level alert or higher.
    * Use reject rules but sparsely.
    * Use configure specific hosts only when absolutely required.




## Setup your team

!!! quote "Lead by example"
    DutyCalls is especially useful for self-organizing teams.

### Add team members

1. Let your team members log on to DutyCalls to ensure the platform recognizes them.
2. Invite your team :material-account-plus: members to your workspace.

### Manage exceptions

DutyCalls uses [manager alerts](https://docs.dutycalls.me/alerts/alert-types/#manager-alerts) to manage exceptions if the regular operation does not go as expected.

A DutyCalls manager can set up *Manager alerts* per workspace or per channel; the best practice is to set these up per workspace and only deviate if necessary.

Alert                  | Default behavior
-----------------------|-----------------------------------------------------
Unacknowledged tickets | Notifies if a ticket is not acknowledged in 1 hour
Acknowledged tickets   | Notifies if an acknowledged is not modified in 1 hour 
Open tickets           | Notifies when a ticket is open for more then 2 hours.


Another critical alert to configure is the minimum number of active subscribers, this must be done per channel.

In most scenarios, you would want at least one subscriber per channel, but for high-profile environments, it might be better to up the number to ensure swift follow-up.

### Subscriber notifications

DutyCalls can notify via email or in-app notifications.

SMS and phone notifications are available using an optional license.

!!! hint "Best practice."
    Using phone notifications ensures the best response from engineers as in-app or SMS notifications tend to get unnoticed.