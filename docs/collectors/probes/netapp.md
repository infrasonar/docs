![NetApp-Probe](../../images/probe_netapp.png){ width="150" align=right}

# NetApp

## Introduction

InfraSonar monitors NetApp systems running Data ONTAP using the ONTAP rest API.

!!! note "SNMP-probe for 7mode"
    It is possible to monitor 7mode NetApp systems using SNMP.
    The monitoring is not as elaborate as the API Probe.

## Features

Some of the features of the InfraSonar NetApp probe:

* NetApp Health Status
* Aggregate and volume and utilization
* Cluster information
* Disk status
* Interface status (Ethernet and FCP)
* CIFS status
* Autosupport configuration
* IOPS
* Snapmirror

### Version specific

Some checks are only available from a specific ONTAP version onward: 

* **cluster node controller info** requires ONTAP v9.9 or higher
* **cluster node statistics** requires ONTAP v9.8 or higher
* **interface and interface ports statistics** requires ONTAP v9.8 or higher
* **SnapMirror transfer data** requires ONTAP v9.11 or higher

## Deployment

The NetApp probe can easily be deployed using our [appliance manager](./appliance/appliance_manager.md).

## Probe configuration

### Credentials

!!! danger "Don't use admin"

    We strongly advise setting up a separate user for monitoring to have a clear separation of responsibilities but also to avoid lock-out issues.


First step is to figure out which vserver to use:

```
vserver show
```


Create a role for InfraSonar with limited access, ensure to use the correct vserver. `vserver show` is your friend :nerd:


```title="Create NetApp role"
security login rest-role create -role infrasonar -vserver netapp01 -api /api -access readonly
security login rest-role create -role infrasonar -vserver netapp01 -api /api/security -access none
security login rest-role create -role infrasonar -vserver netapp01 -api /api/security/audit/destinations -access readonly
security login rest-role create -role infrasonar -vserver netapp01 -api /api/security/authentication/password -access all
security login rest-role create -role infrasonar -vserver netapp01 -api /api/security/certificates -access readonly
```

You can verify this role using:

```title="Verify NetApp role"
security login rest-role show infrasonar
```

Next step is to create a user (`infrasonar`) and assign the previously created role (`infrasonar`) to this user:

```title="Create NetApp user"
security login create infrasonar -role infrasonar -comment "system-monitoring user, readonly" -application ontapi -authentication-method password 
security login create infrasonar -role infrasonar -application http -authentication-method password 
```

Verify the user creation:

```title="Verify NetApp user"
security login show infrasonar
```

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

## Additional information

:material-github: [netapp probe source code](https://github.com/infrasonar/netapp-probe)