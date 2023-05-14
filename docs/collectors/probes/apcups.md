![Eaton-Probe](../../images/probe_apc.png){ width="150" align=right}

# APC UPS

## Introduction

The APC UPS probe uses [snmp](snmp.md) to perform its queries.

## Features

The APC UPS probe consist of a number of UPS specific checks:

:material-check: Battery status<br>
:material-check: Input/output frequency<br>
:material-check: Input/output voltage<br>
:material-check: UPS Load<br>
:material-check: Temperature

## Deployment

The APC UPS probe is deployed as a :material-docker: docker container using [docker compose](appliance/docker_compose.md).

## Probe configuration

The easiest way to configure the APC UPS probe is in most scenarios to tell the probe to use the `snmp` configuration like so:

```yaml
apcups:
  use: snmp
```

The `apcups` section however can contain a custom configuration similar to the [snmp](snmp.md) section.

## Conditions

The label `APC UPS` can be used to configure our default condition set.

