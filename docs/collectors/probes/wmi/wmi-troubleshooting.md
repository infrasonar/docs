# WMI troubleshooting

## Manual query

You can test WMI access from a Windows host or the Linux appliance.

### Linux appliance

WMI command line query for the Linux appliance or any host running Docker.

```bash
docker run --rm -it \
  --network host \
  ghcr.io/infrasonar/wmi-probe \
  pywmitool \
    -a <computername or IP> \
    -u userid> \
    -d <domain> \
    -q "SELECT Name FROM Win32_OperatingSystem"
```

### Windows host

You can test if WMI is working correctly on a Windows host by using the `wbemtest` command:

```
wbemtest
namespace \\<computername or IP>\root\cimv2
query
select name from win32_computersystem
```

!!! note
    Make sure to replace `<domain>`, `<userid>`, and `<computername or IP>` with the correct values.

## WMI-probe - Known issues

### Access denied

There are various possible solutions for an **access denied** error.

#### winrm quickconfig

Run the following command to verify the configuration:

```title="command"
winrm quickconfig
```

This should result in an output similar to the example output below:

```title="output"
WinRM service is already running on this machine.
WinRM is not set up to allow remote access to this machine for management.
The following changes must be made:

Configure LocalAccountTokenFilterPolicy to grant administrative rights remotely
to local users.

Make these changes [y/n]? y

WinRM has been updated for remote management.

Configured LocalAccountTokenFilterPolicy to grant administrative rights remotely
  to local users.
```

#### Verify Security Policy settings

1. Start the group policy editor `gpedit.msc`
2. Navigate to:<br>
   :material-arrow-right-bottom: *Computer Configuration*<br>
   :material-arrow-right-bottom: *Windows Settings*<br>
   :material-arrow-right-bottom: *Security Settings*<br>
   :material-arrow-right-bottom: *Local Policies*<br>
   :material-arrow-right-bottom: *Security Options*
3. check these policies:
    1. `Network access: Do not allow storage of passwords and credentials for network authentication`,<br> this must be set to: **DISABLED**.
    2. `Network access: Sharing and security model for local accounts`,<br> this must be set to **CLASSIC**.
    3. `Network security: LAN Manager authentication level`,<br> should be: **Not Defined**<br> or set to: **Send LM & NTLM - use NTLMv2 session security if negotiated**.<br>*This also should fix any `NTSTATUS: NT_STATUS_ACCESS_DENIED` errors*


#### Remote UAC

If you are monitoring a Windows asset using a local administrator account you might see the notification `unable to authenticate: ACCESS_DENIED (5)`

This might happens if you don't use the local administrator account itself but instead created a separate account, even if this is a member of the local administrators group.

To fix this you need to disable remote User Account Control (UAC). Disabling remote user account control does not disable local UAC functionality.

To disable remote UAC for a workgroup computer:

1. Open the registry editor (`regedit`) on the computer you want to monitor.
2. Browse to the key: `HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System`
3. Locate or create a **DWORD** entry named `LocalAccountTokenFilterPolicy` and provide a **DWORD** value of `1`. To re-enable remote UAC, change this value to `0`.

```
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System]
"LocalAccountTokenFilterPolicy"=dword:00000001
```


### WMI error 0x80041010

Performance counter based checks such as:

- base.cpu
- base.uptime
- base.volume-io

Might give the following WMI Query error:

> WMI Query error occured, error message: NTSTATUS: NT code 0x80041010 - NT code 0x80041010

To resolve this error, use the following command on the troubled host:

```
%windir%\system32\wbem\wmiadap.exe /f
```

### Fix broken WMI setup

#### Rebuild the WMI repository

On Windows XP and above you can use the following command to rebuild the WMI repository:

```
rundll32 wbemupgd, UpgradeRepository
```

#### Reinstall WMI in the registry

The following commands will reinstall WMI in the registry:

```
winmgmt /clearadap
winmgmt /kill
winmgmt /unregserver
winmgmt /regserver
winmgmt /resyncperf
```

### Broken performance counters

To rebuild all Performance counters including extensible and third-party counters, enter the following commands in an Administrative command prompt. Press ENTER after each command.

Rebuilding the counters:

```
cd c:\windows\system32
lodctr /R
cd c:\windows\sysWOW64
lodctr /R
```

Resyncing the counters with Windows Management Instrumentation (WMI):

```
WINMGMT.EXE /RESYNCPERF
```

Stop and restart the Performance Logs and Alerts service.
Stop and restart the Windows Management Instrumentation service.

### Disk performance data missing

Enable Disk performance counters using the following command:

```
DISKPERF -Y
```

You will receive the following message:

> Disk performance counters on this system are now set to start at boot. This change will take effect after the system is rebooted.

See also: [kb102020](http://support.microsoft.com/kb/102020).

### Access denied on SELECT \* FROM Win32_Service

Run the following command in an administrative prompt:

```
sc sdset SCMANAGER D:(A;;CCLCRPRC;;;AU)(A;;CCLCRPWPRC;;;SY)(A;;KA;;;BA)S:(AU;FA;KA;;;WD)(AU;OIIOFA;GA;;;WD)
```

### Reverse DNS

We have seen instances were WMI fails querying on an IP address, if reverse DNS is not ok.

### Netlogon service

Verify that the Netlogon service is running and set to start automatically.
