![HP](../../../images/probe_dell.png){ width="150" align=right}

# Dell iDRAC

## Introduction

The Dell iDRAC probe uses the [snmp](index.md) protocol to perform its queries.

## Features

The Dell iDRAC consist of a number of specific checks:

:material-check:  System status (fan, power supply, memory, teperature cpu)<br>
:material-check:  Eventlog<br>
:material-check:  Firmware

## Deployment

The Dell iDRAC probe can easily be deployed using our [appliance manager](./../appliance/appliance_manager.md).

## Credentials

As the Dell iDRAC probe uses SNMP the SNMP section in our [credentials documentation](../appliance/credentials.md) is applicable for this probe.
The probe configuration uses the `idrac` section as default in the InfraSonar credentials file.

## Conditions

The label `HP ILO` can be used to configure our default condition set.

## Additional information

:material-github: [Dell iDRAC probe source code](https://github.com/infrasonar/idrac-probe)