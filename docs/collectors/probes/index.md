# :material-radar: Probes

## Introduction

!!! quote inline end "Probe mission" 
    We use open standards and vendor-provided technologies to query controlled systems.

Probes are collectors that use open standards or vendor provided methods to retrieve monitoring data from a remote asset.

All InfraSonar provided probes are available as :material-open-source-initiative: open source on our :material-github: [GitHub repository](https://github.com/infrasonar/) as we believe in transparency with regards to data collection and systems access.

When a new asset (host) is added and the InfraSonar admin enables a specific probe for this asset, a discovery routine will be started to identify the asset and determine which checks InfraSonar can perform.

## Deployment

Probes are typically deployed using a Docker image running as a Docker container one or more InfraSonar [appliances](./appliance/index.md).

Upon startup a probe registers itself to the for this probe configured [agentcore](../../application/agentcores.md)

Because probes usually run in the same Docker network as the agentcore, they can easily connect to it.

## Configuration

Probes can easily be deployed using our [appliance manager](./../probes//appliance/appliance_manager.md).