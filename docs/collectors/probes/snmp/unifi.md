![UniFi-Probe](../../../images/probe_unifi.png){ width="150" align=right}

# UniFi

## Introduction

The UniFi probe uses the [snmp](index.md) protocol to perform its queries.

!!! note "See also our API probe"
    You can also use our [Unifi Controller and UniFi device collector](../unificontroller.md).

## Features

The UniFi probe consist of a number of UPS specific checks:

:material-check: System information<br>
:material-check: Radio status<br>
:material-check: VAP status

## Deployment

The UniFi probe can easily be deployed using our [remote appliance manager](../../../application/agentcores.md#remote-appliance-manager).

## Credentials

As the UniFi probe uses SNMP the SNMP section in our [credentials documentation](../appliance/credentials.md) is applicable for this probe.
The probe configuration uses the `unifi` section as default in the InfraSonar credentials file.

## Additional information

:material-github: [UniFi probe source code](https://github.com/infrasonar/unifi-probe)