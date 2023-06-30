# Appliance

You can download our ready-to-run OVA (Open Virtual Appliance) [here](https://storage.googleapis.com/infrasonar-repository/infrasonar-appliance.ova).

After you deployed the appliance there are thre

1. Change the sysadmin password;
2. Configure a static IP address if required;
3. Deploy InfraSonar. 

## Default login

You can logon to the appliance using:

* User: `sysadmin`
* Password: `Infr@S0n@r`

## Change password

Enter the `passwd` command when you are logged on as sysadmin and follow the steps when prompted.

```bash
$ passwd
Changing password for sysadmin.
Current password:
New password:
Retype new password:
passwd: password updated successfully
```

Ensure to keep this password stored somewhere safe.

## Network configuration

The InfraSonar appliance ova uses DHCP by default. You can change this to a static IP by editing the file `/etc/netplan/00-installer-config.yaml`.

!!! note "Indentation is meaningful in YAML"
    Make sure that you use spaces, rather than tab characters, to indent sections. In the default configuration files 2 spaces per indentation level are used, We recommend you do the same.

**DHCP configuration**

:   Example DHCP configuration (default):

    ```yaml title="/etc/netplan/00-installer-config.yaml" hl_lines="4"
    network:
      ethernets:
        ens160:
          dhcp4: true
      version: 2
    ```

**Static IP config**

:   Example static IP configuration:

    ```yaml title="/etc/netplan/00-installer-config.yaml" hl_lines="5 6 7 8 9 10 11 12"
    network:
      version: 2
      ethernets:
        ens160:
          dhcp4: false
         addresses:
          - 192.168.10.10/24
         routes:
          - to: default
            via: 192.168.10.1
         nameservers:
           addresses: [192.168.10.2, 192.168.10.3]
    ```

After you modified your IP configuration you need to apply the new netplan configuration using the following command:

```bash
sudo netplan generate
sudo netplan --debug apply
```
## Deploy InfraSonar

Run our [easy deployment script](./deploy_infrasonar.md) to deploy InfraSonar on the appliance.

## Build your own appliance

When you prefer to perform your own Linux installation or can't use the OVA file format we outlined our installation steps [here](appliance_manual_installation.md).