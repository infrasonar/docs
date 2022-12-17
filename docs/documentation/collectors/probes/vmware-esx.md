# :simple-vmware: VMware ESX

## Features

The VMware ESX probe uses the [VMware API](https://www.vmware.com/support/pubs/sdk_pubs.html) to monitor VMware ESX hosts.

THe ESX probe can be used to monitor standalone VMware ESX hosts as hosts part of a VMware V-center deployment

## Configuration

### Credentials

The VMware API requires a root account to access monitoring data on VMware ESX hosts and an administrative account for monitoring data on VMware Virtual center hosts.

When your VMware implementation uses multiple ESX hosts using the same root password, it can be beneficial to create a *defaultCredentials* file containing the root account and set up a device-specific credentials file for the virtual center hosts.

## Operational

### Known issues

#### Cached API response

Sometimes InfraSonar reports different values than VMware consoles.

The cause for this is that the VMware API sends cached data as a response to queries.

The solution to mitigate this situation is to clean the VMware cache using the following commands on the affected ESX host:

```bash
localcli hardware ipmi sel clear
etc/init.d/sfcbd-watchdog restart
etc/init.d/hostd restart
etc/init.d/vpxa restart
```
