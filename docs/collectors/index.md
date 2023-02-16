![Collectors](../images/collectors.png){ width="150" align=right}

# Collectors

InfraSonar collectors collect monitoring data to be parsed by the InfraSonar cloud platform.

All our general purpose collectors are available as open-source :material-open-source-initiative: on our [GitHub :material-github: page](https://github.com/infrasonar).

Using the provided libraries third parties can easily add additional collectors to our platform.


## Collection concepts

InfraSonar identities three collection concepts to gather data from monitored assets.

* [**Agents**](agents/index.md) run autonomously on a monitored asset and send data directly the to InfraSonar platform
* [**Probes**](probes/index.md) are most often deployed on an appliance and are orchestrated by an [agentcore](../application/agentcores).md<br>*Probes are typically used for agentless monitoring scenario's.*
* [**Services**](services/index.md) collect data "as a service".

