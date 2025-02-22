![wmi-probe](../../../images/probe_wmi.png){ width="150" align=right}

# Eventlog

## Introduction

The Eventlog guest probes uses [WMI](./index.md) to to monitor Microsoft Windows eventlog's.

## Features

* Specific eventID's
* Predefined security IDS's
  
## Deployment

The eventlog probe can easily be deployed and maintained using our [remote appliance manager](../../../application/agentcores.md#remote-appliance-manager).

## Probe configuration

Configuration of the eventlog probe is the similar to deploying the [WMI](index.md) probe as it is in essence an extension of the WMI probe.

## Additional information

### Security eventlog ID's monitored

ID                                                                                               | Description
-------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------
[4624](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4624) | Successful account log on
[4625](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4625) | Failed account log on
[4634](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4634) | An account logged off
[4648](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4648) | A logon attempt was made with explicit credentials
[4719](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4719) | System audit policy was changed.
[4964](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4964) | A special group has been assigned to a new log on
[1102](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=1102) | Audit log was cleared. This can relate to a potential attack
[4720](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4720) | A user account was created
[4722](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4722) | A user account was enabled
[4723](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4723) | An attempt was made to change the password of an account
[4725](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4725) | A user account was disabled
[4728](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4728) | A user was added to a privileged global group
[4732](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4732) | A user was added to a privileged local group
[4756](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4756) | A user was added to a privileged universal group
[4738](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4738) | A user account was changed
[4740](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4740) | A user account was locked out
[4767](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4767) | A user account was unlocked
[4735](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4735) | A privileged local group was modified
[4737](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4737) | A privileged global group was modified
[4755](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4755) | A privileged universal group was modified
[4772](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4772) | A Kerberos authentication ticket request failed
[4777](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4777) | The domain controller failed to validate the credentials of an account.
[4782](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4782) | Password hash an account was accessed
[4616](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4616) | System time was changed
[4657](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4657) | A registry value was changed
[4697](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4697) | An attempt was made to install a service
[4698](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4698) | A scheduled task was created
[4699](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4699) | A scheduled task was deleted
[4700](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4700) | A scheduled task was enabled
[4701](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4701) | A scheduled task was disabled
[4702](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4702) | A scheduled task was updated
[4946](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4946) | A rule was added to the Windows Firewall exception list
[4947](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4947) | A rule was modified in the Windows Firewall exception list
[4950](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4950) | A setting was changed in Windows Firewall
[4954](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4954) | Group Policy settings for Windows Firewall has changed
[5025](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=5025) | The Windows Firewall service has been stopped
[5031](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=5031) | Windows Firewall blocked an application from accepting incoming traffic
[5152](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=5152) | A network packet was blocked by Windows Filtering Platform
[5153](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=5153) | A network packet was blocked by Windows Filtering Platform
[5155](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=5155) | Windows Filtering Platform blocked an application or service from listening on a port
[5157](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=5157) | Windows Filtering Platform blocked a connection
[5447](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=5447) | A Windows Filtering Platform filter was changed
[4663](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4663) | Attempt made to access object
[4688](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4688) | A new process has been created
[4670](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4670) | Permissions on an object were changed
[4672](https://www.ultimatewindowssecurity.com/securitylog/encyclopedia/event.aspx?eventid=4672) | Special privileges assigned to new logon



:material-github: [Windows Event Log probe source code](https://github.com/infrasonar/eventlog-probe)