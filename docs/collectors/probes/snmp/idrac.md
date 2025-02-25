![HP](../../../images/probe_dell.png){ width="150" align=right}

# Dell iDRAC

## Introduction

The Dell iDRAC probe uses the [snmp](index.md) protocol to perform its queries.

## Features

The Dell iDRAC consist of a number of specific checks:

:material-check:  System status (fan, power supply, memory, teperature cpu)<br>
:material-check:  Eventlog<br>
:material-check:  Firmware

## Conditions

The label `iDrac` can be used to configure our default condition set.

## Additional information

:material-github: [Dell iDRAC probe source code](https://github.com/infrasonar/idrac-probe)