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

The APC UPS probe can easily be deployed using our [remote appliance manager](../../../application/agentcores.md#remote-appliance-manager).

## Credentials

As the APC UPS probe uses SNMP the SNMP section in our [credentials documentation](../appliance/credentials.md) is applicable for this probe.
The probe configuration uses the `apcups` section as default in the InfraSonar credentials file.

## Conditions

The label `APC UPS` can be used to configure our default condition set.

## Additional information

:material-github: [APC UPS probe source code](https://github.com/infrasonar/apcups-probe)

