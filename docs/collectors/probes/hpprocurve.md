![HP](../../images/probe_hp.png){ width="150" align=right}

# HP ProCurve

## Introduction

The HP ProCurvce probe uses [snmp](snmp.md) to perform its queries.

## Features

## Deployment

The HP ProCurve probe is deployed as a :material-docker: docker container using [docker compose](appliance/docker_compose.md).

## Probe configuration

The easiest way to configure the HP ILO probe is in most scenarios to tell the probe to use the `snmp` configuration like so:

```yaml
hpprocurve:
  use: snmp
```

The `hpprocurve` section however can contain a custom configuration similar to the [snmp](snmp.md) section.

## Operational

### SNMP version


## Additional information

:material-github: [HP ProCurve probe source code](https://github.com/infrasonar/hpprocurve-probe)


