![Eaton-Probe](../../../images/probe_apc.png){ width="150" align=right}

# APC UPS

## Introduction

The APC UPS probe uses the [snmp](index.md) protocol to perform its queries.

## Features

The APC UPS probe consist of a number of UPS specific checks:

:material-check: Battery status<br>
:material-check: Input/output frequency<br>
:material-check: Input/output voltage<br>
:material-check: UPS Load<br>
:material-check: Temperature

## Deployment

Ensure the following section is added to your :material-docker: [docker-compose](../appliance/docker_compose.md) template to enable the APC UPS probe:

```yaml
  apcups-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/apcups-probe
```

## Credentials

As the APC UPS probe uses SNMP the SNMP section in our [credentials documentation](../appliance/credentials.md) is applicable for this probe.
The probe configuration uses the `apcups` section as default in the InfraSonar credentials file.

## Conditions

The label `APC UPS` can be used to configure our default condition set.

## Additional information

:material-github: [APC UPS probe source code](https://github.com/infrasonar/apcups-probe)

