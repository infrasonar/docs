![HP](../../../images/probe_hp.png){ width="150" align=right}

# HP ILO

## Introduction

The HP ILO probe uses the [snmp](index.md) protocol to perform its queries.

## Features

The HP ILO probe consist of a number of specific checks:

:material-check:  System status (fan, power supply, memory, teperature cpu)<br>
:material-check:  HP Eventlog<br>
:material-check:  Array controller<br>
:material-check:  Storage (logical, phycial)

## Deployment

The HP ILO probe can easily be deployed and maintained using our [remote appliance manager](../../../application/agentcores.md#remote-appliance-manager).

## Conditions

The label `HP ILO` can be used to configure our default condition set.

## Additional information

:material-github: [HP ILO probe source code](https://github.com/infrasonar/hpilo-probe)