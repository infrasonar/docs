# Appliance reseal

## Appliance init

Prior to creating a template the following steps need to be performed:

1. Run the first boot script.
2. Avoid duplicate SSH host keys.
3. Avoid duplicate machine ID's.
4. Cleanup history.


### First boot script

The following script is used to run at first boot.

```bash title="/home/sysadmin/init"
#!/usr/bin/env bash
# Fixes removed SSH host keys
# Note: this requires the use of sudo without password!!
sudo dpkg-reconfigure openssh-server
sudo service ssh restart

# Remove this init script.
rm /home/sysadmin/init
```

Add the script to the crontab to run as first boot:

```bash
chmod +x /home/sysadmin/init
(crontab -l ; echo "@reboot /home/sysadmin/init") | crontab -
```

## Avoid duplicate SSH host keys

To avoid lingering duplicate SSH host keys, we remove them before converting the appliance into a template.

```
sudo rm /etc/ssh/ssh_host_* 
```


## Avoid duplicate machine ID's

See also [this](https://kb.vmware.com/s/article/82229) VMware knowledge base article.

Before cloning, run these commands inside the Linux Guest OS:

```
sudo -s
echo -n > /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id
```

## Cleanup

Remove the history

```bash
history -c
```

## Shutdown

```bash
sudo shutdown -h now
```

## Export the appliance: 

Using the ovftool on Windows and virtual center:

```
cd C:\Program Files\VMware\VMware OVF Tool
ovftool "vi://administrator@vsphere.local@vcenter.lab.test-technology.nl:443 \
   /Datacenter/vm/infrasonar-appliance" \
   "c:\Documents and Settings\sysadmin\infrasonar-appliance.ova"
Enter login information for source vi://vcenter.lab.test-technology.nl/
Username: administrator%40vsphere.local
Password: ********
```

or when using VMware workstation on Linux:

```
ovftool /home/sysadmin/vmware/infrasonar-appliance/infrasonar-appliance.vmx ~/infrasonar-appliance.ova
```


### Create a template

!!! note
    The step below describe our lab configuration, adapt to your own needs.

1. Open virtual center (https://vcenter.lab.test-technology.nl)
2. Browse to the vm: `infrasonar-appliance`
3. Right click the host and select **Clone** -> **Clone to Template**
4. Name the template: `infrasonar-appliance-template`
5. Select a location: `vcenter.lab.test-technology` \ `Datacenter`
6. Select a compute resource: `Datacenter` \ `esxi01.test-technology.nl`
7. Select storage: `truenas`


## TODO


### Change hostname

```
#!/bin/bash
hostnamectl set-hostname "blue"
echo $?
hostnamectl set-hostname ""
echo $?
```

sudo hostnamectl set-hostname "blue"
sudo sed -i 's/infrasonar/blue/g' /etc/hosts

https://www.cyberciti.biz/faq/ubuntu-20-04-lts-change-hostname-permanently/

```
sudo hostnamectl set-hostname ubuntu-2004-nixcraft
```

### Password enforce setting

```bash
# Expire the sysadmin password enforcing the user to change the password at logon
passwd -e sysadmin
```

