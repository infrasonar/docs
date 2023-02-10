# Migration scenarios

There are scenarios where a monitored environment needs to be moved to a container belonging to another organization.

An example of such a scenario is when a monitored environment will be serviced by another managed services partner.

This document outlines our preferred migration approach to ensure uninterrupted monitoring.

## Migration steps

Migrating a monitored environment consists of two steps, which can be performed independently.

1. Monitoring infrastructure transition.
2. Hierarchy transition.

However, the **actual** first step is to contact InfraSonar support to assist with the transition.

InfraSonar support ensures a hassle-free transition by aligning all parties involved.

### Monitoring infrastructure transition

This step involves transiting of the InfraSonar implementation inside the monitored environment; in most cases, this is the monitoring [appliance](../collectors/probes/appliance/index.md).

As this appliance is potentially used to provide other services within the monitored environment, we advise starting with setting up a new appliance (with the [agentcore](../application/agentcores.md) and probes) and transitioning the monitored host to this new agentcore.
This process is similar to decommissioning an agentcore.

We do not recommend a "rip and replace" scenario, as this is not beneficial for the monitored environment.

If the leaving and receiving parties are discussing terms and conditions, we recommend the following first:

1. Deploy a new agentcore infrastructure.
2. Perform a hierarchy transition.
3. Move the monitored hosts to the new agentcore infrastructure.
4. Remove the "old" agentcores from InfraSonar.
5. Decommission and remove leaving party appliance(s).

These steps can be performed without any access to the appliance(s) of the leaving party.

Suppose the leaving party demands the appliance to be removed prior to the hierarchy transition. In that case, InfraSonar monitoring will most likely be disturbed when the orphaned hosts are transitioned to the new agentcore(s).

We strongly encourage a gradual and joint approach, as this ensures uninterrupted monitoring services of the monitored environment.

### Hierarchy transition

A hierarchy transition is the move of a monitored environment from a [container](../introduction/platform.md) of the leaving party to a container of the receiving party.
This is an administrative action performed inside the InfraSonar cloud platform.

This step can **only** be performed by InfraSonar support and requires written and signed consent by the owner or its representative of the monitored environment.
This consent should be sent via email to <support@infrasonar.com>.

InfraSonar support will contact the parties involved to align the timeline for this transition to ensure optimal service for the monitored party.

!!! warning
    Before a hierarchy transition, the leaving party should verify if the notes section does not contain references that should not be transitioned.

During the *hierarchy transition*, the following irreversible actions will be performed:

1. All custom conditions and labels will be removed, as they are the property of the leaving party.
2. All alarms will be removed, as they might contain the usernames of the leaving party.
3. Historical alerts will be removed, as they contain usernames and references to customizations owned by the leaving party.
4. All Channels configuration will be removed.

If you have questions or remarks concerning this section, don't hesitate to contact InfraSonar support.