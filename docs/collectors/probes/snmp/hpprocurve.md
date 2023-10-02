![HP](../../../images/probe_hp.png){ width="150" align=right}

# HP ProCurve

## Introduction

The HP ProCurve probe uses the [snmp](index.md) protocol to perform its queries.

## Features

The HP ProCurve probe consist of a number of UPS specific checks:

:material-check: CPU<br>
:material-check: Memory<br>
:material-check: Sensors

## Deployment

Ensure the following section is added to your :material-docker: [docker-compose](../appliance/docker_compose.md) template to enable the HP ProCurve probe:

```yaml
  hpprocurve-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/hpprocurve-probe
```

## Credentials

As the HP ProCurve probe uses SNMP the SNMP section in our [credentials documentation](../appliance/credentials.md) is applicable for this probe.
The probe configuration uses the `hpprocurve` section as default in the InfraSonar credentials file.

## Conditions

The label `HP ProCurve` can be used to configure our default condition set.

## Additional information

:material-github: [HP ProCurve probe source code](https://github.com/infrasonar/hpprocurve-probe)
