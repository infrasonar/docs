# HP ILO

## Introduction

The HP ILO probe uses [snmp](snmp.md) to perform its queries.

## Features

## Deployment

The HP ILO probe is deployed as a :material-docker: docker container using [docker compose](appliance/docker_compose.md).

## Probe configuration

The easiest way to configure the HP ILO probe is in most scenarios to tell the probe to use the `snmp` configuration like so:

```yaml
hpilo:
  use: snmp
```

The `hpilo` section however can contain a custom configuration similar to the [snmp](snmp.md) section.

## Operational

### SNMP version


## Additional information

:material-github: [HP ILO probe source code](https://github.com/infrasonar/hpilo-probe)
