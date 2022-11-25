# Collectors

InfraSonar collectors collect monitoring data to be parsed by the InfraSonar cloud platform.

All our general purpose collectors are available as open-source :material-open-source-initiative: on our [GitHub :material-github: page](https://github.com/infrasonar).

Using the provided libraries third parties can easily add additional collectors to our platform.

We identify the following collector types:

1. Agents
2. Probes
3. Services

## Agents

[Agents](agents/index.md) run autonomously on a monitored asset and send data directly the to InfraSonar platform.

## Probes

[Probes](probes/index.md) are most often deployed on an appliance and are orchestrated by an [agentcore](probes/agentcore.md).

Probes are typically used for agentless monitoring scenario's.

## Services

[Services](services/index.md) collect data "as a service".



