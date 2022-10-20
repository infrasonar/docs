# :fontawesome-solid-magnifying-glass: Probes

InfraSonar uses probes to retrieve data from monitored assets (hosts).

Probes are the glue between the vendor-provided method of retrieving data, usually an API, and the InfraSonar data format.

!!! quote "Goal"
    We use vendor-provided technologies to query controlled systems.

When a new asset (host) is added and the InfraSonar admin enables a specific probe for this asset, a discovery routine will be started to identify the asset and determine which checks InfraSonar can perform.

## Deployment

Probes are typically deployed using one or more InfraSonar appliances.

The InfraSonar appliance is a ready to run :simple-linux: Linux appliance. See our [Appliance deployment guide](appliance/appliance_deployment.md) on how to deploy an InfraSonar appliance in your network.

## Orchestration

The Agent-core orchestrates our probes and is responsible for scheduling checks. During the startup sequence of a probe, it will “announce” itself to the Agent-core.

The Agent-core also acts as a communication gateway. Data retrieved by the probes is sent to the InfraSonar cloud platform via the Agent-core.

### Communication

``` mermaid
graph LR
  probe[Probe] --> | TCP 7211 | Agentcore[Agent-core] --> | HTTPS 443 | infrasonarcloud[Infra Solar Cloud Platform];
```

Because probes usually run in the same Docker network as the Agent-core, they can easily connect to it.

## Configuration

Probes are deployed as :material-docker: Docker container using [docker compose](https://docs.docker.com/compose/) for orchestration.

Probe behavior, such as setting the log level, can be configured using environment variables in the `/etc/infrasonar/docker-compose.yml` file.
The usage of this file is outlined [here](appliance/appliance_docker_compose.md)

## Operational

### Removing an Agent-core.

When an Agent-core is decommissioned, all hosts monitored by it need to be moved to another Agent-core.

The UI does not allow an Agent-core to be removed if there are still hosts attached to it.


### Reload probe configuration

An InfraSonar admin can force a reload of the local configuration files. For example, when the local configuration is changed. This can be done by adding a file named `reload` inside the configuration folder. For example:

```bash
sudo touch /etc/infrasonar/config/OsWmicProbe/reload
```
