# NetApp

## Features

InfraSonar monitors NetApp systems running Data ONTAP using the ONTAP REST API.

!!! note "SNMP-probe for 7mode"
    It is possible to monitor 7mode NetApp systems using SNMP.
    The monitoring is not as elaborate as the API Probe.


## Configuration 

### Probe configuration

NetApp storage systems are monitored using the root account.
See the [credentials](appliance/credentials.md) section on how to configure credentials.

The probe retrieves monitoring data using the ONTAP REST API on TCP port 443.

## Operational

### danglingSnapshots

When the time difference between 2 snapshots is greater than 21 (also known as monthly backup), an InfraSonar alert is triggered.
There is also a label (`dangling snapshots (vmfs) 7d`) which generates an alert if the snapshot contains the word `vmfs` and the time difference is greater then 7 days.

Possible causes:

- Manual snapshots that have not been cleaned up.
- A reconfigured snapmanager.
- A server that is powered off while the mirror is still running.
