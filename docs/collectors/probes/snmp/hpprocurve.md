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

The HP ProCurve probe can easily be deployed using our [appliance manager](./../appliance/appliance_manager.md).

## Credentials

As the HP ProCurve probe uses SNMP the SNMP section in our [credentials documentation](../appliance/credentials.md) is applicable for this probe.
The probe configuration uses the `hpprocurve` section as default in the InfraSonar credentials file.

## Conditions

The label `HP ProCurve` can be used to configure our default condition set.

## Additional information

:material-github: [HP ProCurve probe source code](https://github.com/infrasonar/hpprocurve-probe)
