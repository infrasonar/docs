![VMware](../../../images/probe_vmware.png){ width="150" align=right}

# VMware ESXi

## Introduction

The VMware **esx-probe** uses the [VMware API](https://www.vmware.com/support/pubs/sdk_pubs.html) to monitor VMware ESXi hosts.

## Features

THe ESXi probe can be used to monitor standalone VMware ESXi hosts as hosts part of a VMware V-center deployment.

We have a default label that contains specific conditions for monitoring stand alone ESXi hosts.

See our overall [VMwware](index.md) documentation for additional information.

* Configuration issues
* Hypervisor status
* Datastores
* Guests
  * Status
  * Virtual disks
  * VMware tools version

## Deployment

The Vmware ESXi probe can best be deployed as a docker container.

:material-docker: [ghcr.io/infrasonar/esx-probe](ghcr.io/infrasonar/esx-probe)

## Configuration

### Credentials

The VMware API requires a regular user account on each monitored ESXi host with read-only permissions to access monitoring data on VMware ESXi hosts.

See the [VMware documentation](https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.hostclient.doc/GUID-172218B8-6DAB-4CEF-A5B7-E3865B9E9EE8.html) on how to setup a local account and grant this account access.

The corresponding `infrasonar.yaml` [^1] section when using for example **infrasonar** as user id looks as follows:

```yaml
esx:
  config:
    username: infrasonar
    password: "some_secure_passw0rd"
```

[^1]: Passwords are encrypted on the appliance the moment the file is saved, see our [credentials documentation](../appliance/credentials.md)

!!! danger "Don't use root"

    We strongly advise setting up a separate user for monitoring to have a clear separation of responsibilities but also to avoid lock-out issues.

## Operational

### Known issues

#### Cached API response

Sometimes InfraSonar reports different values than VMware consoles.

The cause for this is that the VMware API sends cached data as a response to queries.

The solution to mitigate this situation is to clean the VMware cache using the following commands on the affected ESXi host:

```bash
localcli hardware ipmi sel clear
etc/init.d/sfcbd-watchdog restart
etc/init.d/hostd restart
etc/init.d/vpxa restart
```


## Additional information

:material-github: [esx probe source code](https://github.com/infrasonar/esx-probe)