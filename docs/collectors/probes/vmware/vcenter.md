![VMware](../../../images/probe_vmware.png){ width="150" align=right}

# VMware vCenter

## Introduction

The **vcenter-probe** uses the [VMware API](https://www.vmware.com/support/pubs/sdk_pubs.html) to monitor VMware Virtual center hosts.

## Features

* vCenter alarms
* Cluster status
* Hypervisor hosts
* Datastores

!!! tip "VMware guest monitoring"

    We offer a specific probe for VMware guest monitoring to retrieve even more in-depth metrics per virtual machine.
    See our [VMware guest documentation](./vmwareguest.md) for more information.

## Deployment

The vCenter probe can easily be deployed using our [appliance manager](./../appliance/appliance_manager.md).

## Probe configuration

### Credentials

The VMware API requires a user account which is assigned the **Read-only** rol to access monitoring data on VMware vCenter appliance.

#### vCenter integrated with AD

When vCenter is integrated with Active Directory (AD), you will find a group in vCenter that has a corresponding group in AD.

Simply create a user with read-only permissions for your vCenter environment in AD and add it to the corresponding AD group. Your credentials for vCenter will be in the format of username@windows.domain.

The corresponding `infrasonar.yaml` [^1] section when using for example *infrasonar@vsphere.local* as user id looks as follows:

```yaml
vcenter:
  config:
    username: infrasonar@windows.domain
    password: "some_secure_passw0rd"
```

[^1]: Passwords are encrypted on the appliance the moment the file is saved, see our [credentials documentation](../appliance/credentials.md)

#### vCenter standalone

When vCenter is not integrated with AD, you will create a new read-only user in your vSphere client and grant this account read-only access.

See the [VMware documentation](https://docs.vmware.com/en/VMware-vSphere/7.0/com.vmware.vsphere.vcenter.configuration.doc/GUID-CAB3C0D8-978E-47AE-82D8-0D95C4005B41.html) on how to setup a local `@windows.domain` account and how to grant this account read-only access.

The corresponding `infrasonar.yaml` [^1] section in this scenario:

```yaml
vcenter:
  config:
    username: infrasonar@vsphere.local
    password: "some_secure_passw0rd"
```

## Additional information

:material-github: [vcenter probe source code](https://github.com/infrasonar/vcenter-probe)