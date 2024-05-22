![ReadyNAS-Probe](../../../images/probe_readynas.png){ width="150" align=right}

# Netgear - ReadyNAS

!!! danger "Preview"

    The ReadyNAS probe is a preview release.<br>
    Contact [InfraSonar support](../../introduction/support.md) if you want to get involved in testing our preview release.


## Introduction

InfraSonar monitors ReadyNAS storage systems using [snmp](index.md).

## Features

### TODO

:material-check: System information<br>
:material-check: Disk status<br>
:material-check: RAID status<br>
:material-check: Services<br>
:material-check: IO

## Deployment

The ReadyNAS probe can easily be deployed using our [appliance manager](./../appliance/appliance_manager.md).

## Credentials

As the ReadyNAS probe uses SNMP the SNMP section in our [credentials documentation](../appliance/credentials.md) is applicable for this probe.
The probe configuration uses the `readynas` section as default in the InfraSonar credentials file.

## Additional information

:material-github: [ReadyNAS probe source code](https://github.com/infrasonar/readynas-probe)

