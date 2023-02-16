![Synology](../../images/probe_synology.png){ width="150" align=right}

# Synology

## Introduction

The Synology probe uses [snmp](snmp.md) to perform its queries.

## Features

* System information
* Disk status
* RAID status
* Services
* IO

!!! tip "Docker supported Synology"

    Some Synology models support docker!
    You can utilize our [docker agent](../agents/docker.md) to monitoring the containers running in the NAS.

    You can also use the NAS to deploy our probes and utilize the NAS also a monitoring appliance.
    This works flawlessly as the InfraSonar resource usage is minimal.

## Deployment

The Synology probe is deployed as a :material-docker: docker container using [docker compose](appliance/docker_compose.md).

## Probe configuration

The easiest way to configure the Synology probe is in most scenarios to tell the probe to use the `snmp` configuration like so:

```yaml
synology:
  use: snmp
```

The `synology` section however can contain a custom configuration similar to the [snmp](snmp.md) section.

## Additional information

:material-github: [Synology probe source code](https://github.com/infrasonar/synology-probe)

