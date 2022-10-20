# Credentials

Some InfraSonar probes require credentials to authenticate its queries. A good example is the WMI-probe that requires Windows domain credentials to perform WMI queries.

Credentials are stored securely on the appliance at the monitored infrastructure and will only be used within the boundaries of the appliance.

## Credential files

Each probe has its own default credential file and optional asset/host specific credential files to accommodate for example non-windows domain hosts.

At this time, we are moving to an improved approach to our credential files, which allows us to use the credential files for other configuration tweaks as well.
    
As such, we have two approaches to credential files. [Version 1.x](credentials.md#version-1) and [Version 2.x](credentials.md#version-2). The table below shows which probes have been ported to the enhanced Version 2.x approach.

Probe                                          | credentials path                       | Version
-----------------------------------------------|-----------------0----------------------|------------------------------
[Microsoft Azure-probe](../microsoft_azure.md) | `/etc/infrasonar/config/azureprobe`    | [2.x](credentials.md#version-2)
[Microsoft SQL-probe](../microsoft_sql.md)     | `/etc/infrasonar/config/OsMsSqlProbe`  | [1.x](credentials.md#version-1)
[Microsoft WMI-probe](../wmi.md)               | `/etc/infrasonar/config/wmiprobe`      | [2.x](credentials.md#version-2)
[NetApp probe](../netapp.md)                   | `/etc/infrasonar/config/OsNetAppProbe` | [2.x](credentials.md#version-1)
[Pure storage probe](../pure_probe.md)         | `/etc/infrasonar/config/OsVmwareProbe` | [1.x](credentials.md#version-1)
[VMware probe](../vmware.md)                   | `/etc/infrasonar/config/OsVmwareProbe` | [1.x](credentials.md#version-1)

!!! info Transition

    Please ensure you choose the correct approach for the probe version you are configuring.

## Credential file

The credentials files use the following layout:

```ini
[credentials]
username = <<username used to query the remote host>>
password = <<password belonging to the configured username>>
```

When Microsoft Active directory accounts are used the username can be either in domain format `domain\infrasonar_service_account` or use the UPN format: `infrasonar_service_account@domain.something`

## Version 1.x

### Default credential file

The default credential file is: `defaultCredentials.ini`

### Host specific credentials files

Specific credentials for a given host can be proved using an `<address>.ini` file.

for example `192.168.99.2.ini`

### Encryption

The password is encrypted upon first use by the probe.

### Reloading

The credential files are read every time a check runs.

## Version 2.x

### Default credential file

The default credential file is: `defaultAssetConfig.ini`

### Host specific credentials files

Specific credentials for a given host can be proved using an `<<probe-address>>.ini` file or `<<host-uuid>>.ini`

For example `192.168.99.2.ini` or `xxxxxxxxxxxx-yyyyyyyyyyyy.ini`

Using `<<host-uuid>>.ini` makes it easier to use credentials for hosts using dynamic IP addresses.

### Encryption

The password must be encrypted by an InfraSonar admin using the InfraSonar webinterface.

1. Navigate as an InfraSonar admin to the host where you added the version 2.x probe
2. Click edit host :material-playlist-edit: button
3. Select the **probe** tab
4. Click the link in this section: *Passwords in the config files can be encrypted. Use this to encrypt a value.*
   ![credentials_link](../../../../images/credentials_version2_1.png{ width="600" }
5. Enter the password in the value field and press the **encrypt** button
   ![credentials_encrypt](../../../../images/credentials_version2_2.png){ width="600" }
6. Copy the encrypted password using the copy to clipboard icon
7. Enter the password in the password field of the corresponding credentials **.ini** file on the appliance.

!!! Note
    The browser does not store either the entered or encyrpted password anywhere, it is just a javascript running in your browser performing the encryption.

### Reloading

Version 2.x probes can be forced to reload the local configuration files by creating an empty file named `reload` inside the configuration folder.

For example:

```bash
sudo touch /etc/infrasonar/config/micProbe/reload
```

## Probe specifics

### Microsoft Azure probe

For the Microsoft Azure probe the credential file looks as such:

```ini
[credentials]
tenantId = `Directory (tenant) ID`
clientId = `Application (client) ID`
clientSecret = `encrypted client secret`
```

See also the credentials section in the [Azure probe documentation](../microsoft_azure.md#credentials).


## FAQ

### is it possible to copy credentials?

If the credentials match, it is possible to copy the credentials file from the [WMI-probe](../wmi.md) to the [MSSQL-probe](../microsoft_sql.md).

!!! warning "Copying credentials"
    Copying credentials to another appliance won't work, since the encrypted credentials are bound to the appliance.
