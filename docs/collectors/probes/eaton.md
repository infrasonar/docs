![Eaton-Probe](../../images/probe_eaton.png){ width="200" align=right}

# Eaton

## Introduction

The Eaton probe uses [snmp](snmp.md) to perform its queries.

## Features

UPS monitoring

* Battery status
* Alarms
* Input, Bypass & Output measurement
* Environmental monitoring, temperature and humidity


## Deployment

The Eaton probe is deployed as a :material-docker: docker container using [docker compose](appliance/docker_compose.md).

## Probe configuration

The easiest way to configure the Eaton probe is in most scenarios to tell the probe to use the `snmp` configuration like so:

```yaml
eaton:
  use: snmp
```

The `eaton` section however can contain a custom configuration similar to the [snmp](snmp.md) section.

## Operational

### SNMP version

We noted we had te use SNMP version 1 in most scenario's we deployed this probe.

## Additional information

:material-github: [Eaton probe source code](https://github.com/infrasonar/eaton-probe)
