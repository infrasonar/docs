![Alerts](../images/concept_alert.png){ width="150" align=right}

# :material-bell: Alerts & Notifications

> Understanding InfraSonar's Issue Differentiation

InfraSonar uniquely distinguishes between issues detected within your data and those arising from data retrieval problems. This distinction is crucial for effective monitoring and can sometimes be a source of confusion.

## Alerts

Data-Driven Issue Detection.

* **Trigger:** Alerts are generated when predefined conditions, defined using the `return` statement, are met within the collected monitoring data.
* **Timing:** These conditions are evaluated in real-time as data arrives, ensuring immediate detection of anomalies.
* **Scope:** Alerts directly reflect issues within the monitored data itself.
* **Management:** Alerts integrate seamlessly with your operational incident management process, allowing for:
    * Adding detailed messages.
    * Assigning responsibility to specific users.
    * Resolving and closing alerts.

## Notifications

Monitoring Service Integrity

* **Trigger:** Notifications are raised by the InfraSonar platform when expected data is missing or when errors occur during data retrieval or parsing.
* **Significance:** Notifications indicate a potential disruption or failure in the monitoring service itself.
* **Resolution:** Prompt resolution is essential to maintain monitoring integrity. This typically involves:
    * Restoring data access.
    * Disabling problematic checks.
* **Focus:** Notifications focus on the health of the monitoring platform itself.


## Rules

[Rules](../application/rules.md) can be used for both alerts and notifications to send external notifications or start automation actions using webhooks.

!!! tip "Considerations while configuring rules"
    When setting up rules take notifications into consideration as they can be a powerful indictor something is wrong within an infrastructure. Take for example an internet outage, this results in an [Agentcore](../collectors/probes/agentcore.md) disconnected notification as we no longer receive data.