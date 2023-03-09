![NetApp-Probe](../../images/probe_netapp.png){ width="150" align=right}

# SANtricity / NetApp E-Series

## Introduction

InfraSonar monitors SANtricity / NetApp E-Series systems running rest API.

### background information 

In SANtricity / NetApp E-Series, volumes, disks, and storage pools are related in a hierarchical manner.

At the lowest level, disks are physical storage devices that are installed in a storage system. These disks can be combined into disk pools, which are logical groups of disks that can be used to create volumes.

Volumes are logical storage units that are created from disk pools. Volumes can be divided into smaller units called LUNs (Logical Unit Numbers), which are presented to hosts as individual disks.

When creating a volume, users can choose from different RAID (Redundant Array of Independent Disks) levels, which determine the level of data protection and performance of the volume. SANtricity supports RAID levels 0, 1, 3, 5, 6, and 10.

Users can also configure different settings for their volumes, such as the size of the volume, the block size, and the access control settings.

Overall, the relationship between volumes, disks, and storage pools in SANtricity is designed to provide users with a flexible and scalable storage infrastructure. By combining disks into storage pools and creating volumes from those pools, users can optimize storage usage and achieve better storage performance.

## Features

Some of the features of the InfraSonar NetApp probe:

* System Health status
* Storage pool status
* Volume status
* Controller status
* Disk status status


## Deployment

The SANtricity / NetApp E-Series probe is deployed as a :material-docker: docker container using [docker compose](appliance/docker_compose.md).

## Probe configuration

* **Address**: IP address of FQDN of them anagement interface
* **Port**: The probe retrieves monitoring data using the ONTAP REST API on TCP port 8443, note we encountered deployments using TCP port 443.
* **Storage system ID**: Storage system id to retrieve stats from. Can also be the WWN of the storage system. When not given we collect stats from "1"

### Credentials

The SANtricity / NetApp E-Series probe used the standard username/password configuration as described in our[credentials](appliance/credentials.md) section.

!!! danger "Don't use admin"

    We strongly advise using the **monitor** user as this is a user with read-only access to the system.
    This user profile includes only the Monitor role.

## Additional information

:material-github: [SANtricity / NetApp E-Series probe source code](https://github.com/infrasonar/santricity-probe)