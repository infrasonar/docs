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

The SANtricity / NetApp E-Series probe can easily be deployed using our [appliance manager](./appliance/appliance_manager.md).

## Probe configuration

* **Address**: IP address of FQDN of them management interface
* **Port**: The probe retrieves monitoring data using the ONTAP REST API on TCP port 8443, note we encountered deployments using TCP port 443.
* **Storage system ID**: Storage system id to retrieve stats from. Can also be the WWN of the storage system. When not given we collect stats from "1"

### Credentials

#### SANtricity / NetApp E-Series

The SANtricity / NetApp E-Series probe is configured in the `santricity` section:


```yaml
santricity:
  config:
    password: "some_secure_passw0rd"
    username: monitor
```



The SANtricity / NetApp E-Series probe used the standard username/password configuration as described in our[credentials](appliance/credentials.md) section.

!!! danger "Don't use admin"

    We strongly advise using the **monitor** user as this is a user with read-only access to the system.
    This user profile includes only the Monitor role.

## How to configure SNMP monitoring on E-Series
​
### Applies to

* Flash Array
* E-Series Controller Firmware 7.xx
* E-Series Controller Firmware 6.xx

### Description

Simple Network Management Protocol (SNMP) is used for remote status monitoring of servers, network appliances, and software processes. SNMP is designed for an IT administrator to monitor the active technology assets, which are required to perform the business' day to day activities. SANtricity provides a portal for IT administrators to remote monitor their storage array. This article describes the procedure to configure SNMP.

### Procedure
Perform the following steps to configure SNMP in SANtricity:  

1. Open the Enterprise Management window of SANtricity and select the array that you would like to configure for SNMP.
2. Right-click on the Array and select Configure Alerts.<br>
   A new window opens. Click the SNMP tab at the top:<br>
   An IT Administrator can configure SNMP for this storage array.<br>
   Since SANtricity is software based and it relays the active status' of the storage array, there is only one option for configuring SNMP and it is by sending traps.<br>
   SNMP requires two data points for sending traps, a *Community Name* and the *Trap destination*. The Community Name, also known as the *community string* should match the SNMP configured Community Name (string). The Trap Destination will be the IP address or host name of the SNMP server or relay.
3. To obtain the MIB (Management Information Base) file for use in a third party SNMP server, perform the following steps:
    1. Go to the NetApp Support Software download page.
    2. Locate E-Series/EF-Series SANtricity Storage Manager and click Go!
    3. Click View & Download on the latest version of SANtricity software.
    4. Click Continue at the bottom of the page.
    5. Read the EULA and click Accept.
    6. Scroll down to the MIB File section.
    7. Click the download link for the .MIB file labeled MIB file for SNMP traps.

Note: For further info please see the Alert Notification Using Email to SNMP Traps section located in the [Initial Configuration and Software Installation for SANtricity® Storage Manager](https://library.netapp.com/ecm/ecm_get_file/ECMP1394572) document.

If you have any issues or concerns with configuring SNMP within SANtricity, contact NetApp Support. 

## Additional information

:material-github: [SANtricity / NetApp E-Series probe source code](https://github.com/infrasonar/santricity-probe)