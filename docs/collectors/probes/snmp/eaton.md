![Eaton-Probe](../../../images/probe_eaton.png){ width="150" align=right}

# Eaton

## Introduction

The Eaton probe uses the [snmp](index.md) protocol to perform its queries.

## Features

The Eaton probe consist of a number of UPS specific checks:

:material-check: Battery status<br>
:material-check: Alarms<br>
:material-check: Input, Bypass & Output measurement<br>
:material-check: Environmental monitoring, temperature and humidity<br>

## Deployment

Ensure the following section is added to your :material-docker: [docker-compose](../appliance/docker_compose.md) template to enable the Eaton probe:

```yaml
  eaton-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/eaton-probe
```

## Credentials

As the Eaton probe uses SNMP the SNMP section in our [credentials documentation](../appliance/credentials.md) is applicable for this probe.
The probe configuration uses the `eaton` section as default in the InfraSonar credentials file.

## Conditions

The label `Eaton UPS` can be used to configure our default condition set.

### Eaton UPS input source

A noteworthy condition is the **Eaton UPS input source** condition as this condition is triggered when the UPS lost it's main power.

An interesting use case for this condition is to setup a rule to send a voice call to notify on-call personal when main power is lost.

!!! note "Good to known"

    As the UPS occasionally switches to battery power for a couple of seconds as part of its maintenance routine this condition potential get's triggered while all is well.
    To avoid sending incorrect notification we wait one cycle before sending out an alert.

    As the check interval for this check is 1 minute sending out a notification for this event can potentially take a maximum off 2 minutes.

## Operational

### SNMP version

We noted we had to use SNMP version 1 in most scenario's we deployed this probe.

## Additional information

* [Vendor SNMP MIB information](https://www.eaton.com/content/dam/eaton/products/backup-power-ups-surge-it-power-distribution/power-management-software-connectivity/eaton-network-card-ms/eaton-ups-power-mib-release-notes.txt)
* [InfraSonar Eaton probe source code :material-github:](https://github.com/infrasonar/eaton-probe)
