![Eaton-Probe](../../images/probe_eaton.png){ width="150" align=right}

# Eaton

## Introduction

The Eaton probe uses [snmp](snmp.md) to perform its queries.

## Features

The Eaton probe consist of a number of UPS specific checks:

:material-check: Battery status<br>
:material-check: Alarms<br>
:material-check: Input, Bypass & Output measurement<br>
:material-check: Environmental monitoring, temperature and humidity<br>

## Deployment

The Eaton probe is deployed as a :material-docker: docker container using [docker compose](appliance/docker_compose.md).

## Probe configuration

The easiest way to configure the Eaton probe is in most scenarios to tell the probe to use the `snmp` configuration like so:

```yaml
eaton:
  use: snmp
```

The `eaton` section however can contain a custom configuration similar to the [snmp](snmp.md) section.

## Conditions

The label `Eaton UPS` can be used to configure our default condition set.

### Eaton UPS input source

A noteworthy condition is the **Eaton UPS input source** condition as this condition is triggered when the UPS lost it's main power.

An interesting use case for this condition is to setup a DutyCalls rule to notify on-call personal when main power is lost.

!!! note "Good to known"

    As the UPS occasionally switches to battery power for a couple of seconds as part of its maintenance routine this condition potential get's triggered while all is well.
    To avoid sending incorrect notification we wait one cycle before sending out an alert.

    As the check interval for this check is 1 minute sending out a notification for this event can potentially take a maximum off 2 minutes.

## Operational

### SNMP version

We noted we had te use SNMP version 1 in most scenario's we deployed this probe.

## Additional information

* [Vendor SNMP MIB information](https://www.eaton.com/content/dam/eaton/products/backup-power-ups-surge-it-power-distribution/power-management-software-connectivity/eaton-network-card-ms/eaton-ups-power-mib-release-notes.txt)
* [InfraSonar Eaton probe source code :material-github:](https://github.com/infrasonar/eaton-probe)
