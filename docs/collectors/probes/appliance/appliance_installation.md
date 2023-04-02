# Appliance

You can download our ready-to-run OVA (Open Virtual Appliance) [here](https://storage.googleapis.com/infrasonar-repository/infrasonar-appliance.ova).

After you deployed the appliance there are thre

1. Change the sysadmin password;
2. Configure a static IP address if required;
3. Deploy InfraSonar. 

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

!!! note YAML file
    This config file is a YAML file and as such proper indentation is crucial.

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

    ```yaml title="/etc/netplan/00-installer-config.yaml" hl_lines="4 5 6 7"
    network:
      ethernets:
        ens160:
          addresses: [192.168.1.3/24]
          gateway4: 192.168.1.1
          nameservers:
            addresses: [192.168.1.10, 192.168.1.11]
      version: 2
    ```

After you modified your IP configuration you need to apply the new netplan configuration using the following command:

```bash
$ sudo netplan apply
```

## Deploy InfraSonar

Run our [easy deployment script](./deploy_infrasonar.md) in a directory of your choosing, we suggest using `/etc/infrasonar`.



## Build your own appliance

When you prefer to perform your own Linux installation or can't use the OVA file format we outlined our installation steps [here](appliance_manual_installation.md) 
