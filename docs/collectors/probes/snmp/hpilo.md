![HP](../../../images/probe_hp.png){ width="150" align=right}

# HP ILO

## Introduction

The HP ILO probe uses the [snmp](index.md) protocol to perform its queries.

## Features

The HP ILO probe consist of a number of UPS specific checks:

:material-check:  System status (fan, power supply, memory, teperature cpu)<br>
:material-check:  HP Eventlog<br>
:material-check:  Array controller<br>
:material-check:  Storage (logical, phycial)

## Deployment

Ensure the following section is added to your :material-docker: [docker-compose](../appliance/docker_compose.md) template to enable the HP ILO probe:

```yaml
  hpilo-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/hpilo-probe
```

## Credentials

As the HP ILO probe uses SNMP the SNMP section in our [credentials documentation](../appliance/credentials.md) is applicable for this probe.

## Conditions

The label `HP ILO` can be used to configure our default condition set.

## Additional information

:material-github: [HP ILO probe source code](https://github.com/infrasonar/hpilo-probe)