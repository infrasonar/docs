![Agentcore](../../images/application_agentcore.png){ width="150" align=right}

# :material-radar: Agentcore

The Agentcore orchestrates our [probes](../index.md) and is responsible for scheduling checks.
During the startup sequence of a probe, it will “:material-bullhorn-variant-outline: announce” itself to the Agentcore.

The Agentcore also acts as a communication gateway. Data retrieved by the probes is sent to the InfraSonar cloud platform via the Agentcore.

``` mermaid
graph LR
  probe[Probe] --> | TCP 8750 | Agentcore[Agentcore] --> | HTTPS 8730 | infrasonarcloud[InfraSonar Cloud Platform];
```

As probes usually run in the same Docker network as the Agentcore, they can easily connect to it.

!!! note ""
    it is possible to use TCP port 443 instead of 8730 we don't recommended this but some environment refuse inter traffic to ports other then 80 and 443

## Features

### Resumable operation

If an Agentcore is shutdown properly a list of assets and a check result queue are saved on disk.
Given the Agentcore starts and it can't connect to the InfraSonar cloud platform the list of saved assets will be used to resume operations.
Check results up to a maximum of 100.000 packages will be stored in a queue.

### Multiple Agentcores

InfraSonar supports multiple Agentcores within a monitored environment. Deploying multiple Agentcores can be useful in spreading the network load, accommodate for network segmentation, and supporting large-scale implementations.

To support network segmentation, assets can be assigned to a [zone](../../application/zones.md). When this zone also has an Agentcore assigned its assets will automatically be monitored using the Agentcores in this zone.

When you deploy multiple Agentcores in a zone, assets will be evenly distributed between all Agentcores in this zone..

!!! tip "No automagic failover"
    If an Agentcore fails it's role will not automatically be taken over by another Agentcore. To accomplish this, the failing Agentcore needs to be removed by an InfraSonar admin.

## Operational

### Removing an Agentcore

When an Agentcore is decommissioned, all hosts monitored by are automatically transferred to other Agentcores in the configured zone.

You can remove an Agentcore in our [Agentcore](../../application/agentcores.md) panel.