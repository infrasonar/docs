![UniFi-Probe](../../images/probe_unifi.png){ width="200" align=right}

# UniFi

## Introduction

The UniFi probe uses [snmp](snmp.md) to perform its queries.

## Features

## Deployment

The UniFi probe is deployed as a :material-docker: docker container using [docker compose](appliance/docker_compose.md).

## Probe configuration

The easiest way to configure the UniFi probe is in most scenarios to tell the probe to use the `snmp` configuration like so:

```yaml
unifi:
  use: snmp
```

The `unifi` section however can contain a custom configuration similar to the [snmp](snmp.md) section.

## Operational

### SNMP version


## Additional information

:material-github: [UniFi probe source code](https://github.com/infrasonar/unifi-probe)