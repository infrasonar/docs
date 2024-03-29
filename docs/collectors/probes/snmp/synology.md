![Synology](../../../images/probe_synology.png){ width="150" align=right}

# Synology

## Introduction

The Synology probe uses the [snmp](index.md) protocol to perform its queries.

## Features

:material-check: System information<br>
:material-check: Disk status<br>
:material-check: RAID status<br>
:material-check: Services<br>
:material-check: IO

!!! tip "Docker supported Synology"

    Some Synology models support docker!
    You can utilize our [docker agent](../../agents/docker.md) to monitoring the containers running in the NAS.

    You can also use the NAS to deploy our probes and utilize the NAS also a monitoring appliance.
    This works flawlessly as the InfraSonar resource usage is minimal.

## Deployment

The Synology probe can easily be deployed using our [appliance manager](./../appliance/appliance_manager.md).

## Credentials

As the Synology probe uses SNMP the SNMP section in our [credentials documentation](../appliance/credentials.md) is applicable for this probe.
The probe configuration uses the `synology` section as default in the InfraSonar credentials file.

## Additional information

:material-github: [Synology probe source code](https://github.com/infrasonar/synology-probe)

