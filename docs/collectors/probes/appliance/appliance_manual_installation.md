# Appliance

This section outlines how to install the :fontawesome-brands-linux: Linux appliance from scratch.

## Installation

:material-ubuntu: Ubuntu Server 22.04 LTS is used as the basis for the InfraSonar appliance.

Create a new virtual machine using these specifications:

* **Compatibility**: Compatible with: ESXi 6.5 and later VM version 13
* **Guest OS Family**: Linux
* **Guest OS Version**: Ubuntu Linux (64-bit) 
* **CPU**: 2 CPU
* **Memory**: 2 GB memory
* **Disk**: 40 GB HDD
* **Name**: infrasonar-appliance

### Installation steps

Boot from the Ubuntu Server 22.04.1 ISO and then follow these steps:

1. Select your language: **English**.
2. Keyboard configuration:
    1. Layout: **English (US)**.
    2. Variant: **English (US)**.
3. Choose the type of install: **Ubuntu server (minimized)**
4. Network configuration: DHCP. (*Note it can take some time for an IP address to get assigned*)
5. Proxy address: enter a proxy address if your environment uses a proxy, otherwise leave empty.
6. Mirror address: **keep as it is**, *unless you know what you are doing*.
7. Guided storage configuration:
    1. Select: **Use an entire disk**.
    2. Deselect: **Set up this disk as an LVM group**.
8. Storage configuration:
   1. Review the file system summary and select: **Done**.
9. Confirm destructive action, by clicking: **Continue**.
10. Profile setup:
    1.  Your name: *sysadmin*.
    2.  Your server's name: *infrasonar-appliance*.
    3.  Pick a username: *sysdmin*.
    4.  Choose a password: Infr@S0n@r
    5.  Confirm your password: Infr@S0n@r
11. SSH Setup:
    1.  Select: **Install OpenSSH Server**.
    2.  Import SSH identity: **No**.
12. Featured Server Snaps: do not select any server snaps.
13. If the installation is ready, select: **Reboot now**.

!!! note
    Do not forget to unmount the ISO.

## Post installation steps

Login to the appliance using SSH to perform the *post installation* steps.

```
ssh sysadmin@<server-ip>
```

### Upgrade

```bash update and upgrade
sudo apt update
sudo apt upgrade
sudo reboot
```

### VMware tools

It is recommended to install [open-vm-tools](https://github.com/vmware/open-vm-tools), when the appliance is installed on a VMware hypervisor platform.

```bash 
# Update the APT package index.
sudo apt update
# Install open VMware tools.
sudo apt install -y open-vm-tools
```

### Miscellaneous tools

```bash
sudo apt install -y vim nano cron dnsutils snmp iputils-ping
```

### Docker installation

All InfraSonar components run as Docker containers and are orchestrated using docker-compose.

The official Docker engine installation instructions can be found [here](https://docs.docker.com/engine/install/ubuntu/).

```bash
sudo apt update
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```

### Unattended updates

As we want the InfraSonar appliance to be zero maintenance, we configure unattended updates and allow the appliance to reboot when necessary at 2:00 CET.

**Ubuntu unattended upgrades installation**

```bash
# Install the unattended-upgrades package.
sudo apt install -y unattended-upgrades
# Verify using the following systemctl command.
sudo systemctl status unattended-upgrades
# To set automatic updates, we are going to install the update-notifier-common package.
sudo apt install -y update-notifier-common
```

**Ubuntu unattended upgrades configuration**

Change the file `/etc/apt/apt.conf.d/50unattended-upgrades`, so it reflects these changes:

```hl_lines="11 20 24 29"
....
Unattended-Upgrade::Allowed-Origins {
        "${distro_id}:${distro_codename}";
        "${distro_id}:${distro_codename}-security";
        // Extended Security Maintenance; doesn't necessarily exist for
        // every release and this system may not have it installed, but if
        // available, the policy for updates is such that unattended-upgrades
        // should also install from here by default.
        "${distro_id}ESMApps:${distro_codename}-apps-security";
        "${distro_id}ESM:${distro_codename}-infra-security";
        "${distro_id}:${distro_codename}-updates";
//      "${distro_id}:${distro_codename}-proposed";
//      "${distro_id}:${distro_codename}-backports";
        "Docker:${distro_codename}";
};

....

// Automatically reboot *WITHOUT CONFIRMATION* if
// the file /var/run/reboot-required is found after the upgrade.
Unattended-Upgrade::Automatic-Reboot "true";

// Automatically reboot even if there are users currently logged in
// when Unattended-Upgrade::Automatic-Reboot is set to true.
Unattended-Upgrade::Automatic-Reboot-WithUsers "true";

// If automatic reboot is enabled and needed, reboot at the specific
// time instead of immediately.
// Default: "now".
Unattended-Upgrade::Automatic-Reboot-Time "02:00";
....
```

**Enable daily unattended upgrades**

```bash
echo unattended-upgrades unattended-upgrades/enable_auto_updates boolean true | sudo tee -a debconf-set-selections
sudo dpkg-reconfigure -f noninteractive unattended-upgrades
```

You can verify that automatic updates are turned on, with this command:

```bash
sudo debconf-get-selections | grep -i enable_auto_updates
```

!!! note
    `debconf-get-selections` requires debconf-utils to be installed (`sudo apt-get install debconf-utils`).
    We opt not to install this on production appliances, as we want to keep them as clean as possible.

**Logging**

Unattended Upgrades Log.

The `unattended-upgrades.log` is a log file where you can view all actions done by the unattended upgrade system. You can view the file with, for example, the tail command:

```bash
tail -n 100 /var/log/unattended-upgrades/unattended-upgrades.log
```

### SSH configuration

Edit the file `/etc/ssh/sshd_config` to harden SSH access:

```title="/etc/ssh/sshd_config" hl_lines="3 10 12 13 18 19 20 21 25 26 28"
...
# Logging
SyslogFacility AUTHPRIV
# LogLevel INFO

...

# Authentication:
LoginGraceTime 10m
PermitRootLogin no
#StrictModes yes
MaxAuthTries 3
MaxSessions 1

...

AllowAgentForwarding no
AllowTcpForwarding no
#GatewayPorts no
X11Forwarding no

```

Restart the SSH service to load the changes made.

```bash
sudo service ssh restart
```

!!! note "SSH hardening options"

    The above change implements these hardening options:

    1. Block clients for 10 minutes after 3 failed login attempts.
    2. Disallow root from logging in.
    3. Disable connection multiplexing, which can be used to bypass authentication.
    4. Disable user environment forwarding.

### SNMPD

To monitor the Linux operating system, install the snmpd daemon:

```bash
sudo apt install -y snmpd
```

As we use the default community string `public` and only require the snmpd daemon to listen on `localhost`, no further configuration is required.

```
# Read-only access to everyone to the systemonly view
rocommunity  public default
rocommunity6 public default -V systemonly
```

### tmate

[tmate](https://tmate.io/) is installed to offer remote support on request.

```bash
sudo apt install -y tmate
```

### sudo configuration

We opt to allow command to be executed using sudo without asking for a password.

Edit the sudo config by starting the editor 

```
sudo visudo
```

Make the following modification:

```
# Allow members of group sudo to execute any command
%sudo   ALL=(ALL:ALL) NOPASSWD:ALL
```

### InfraSonar

InfraSonar is deployed on the appliance using Docker.

We opt to use `/etc/infrasonar` as the main directory.

```bash
sudo mkdir /etc/infrasonar
```

Next step is to setup the Docker compose file in `/etc/infrasonar/docker-compose.yml`.
This file is outlined [here](docker_compose.md)

On the downloadable appliance we provide the `docker-compose.yml` file at the following location `/etc/infrasonar/docker-compose.yml.example`.

### Appliance init

Prior to creating a template the following steps need to be performed:

1. Run the first boot script.
2. Avoid duplicate SSH host keys.
3. Avoid duplicate machine ID's.


#### First boot script

The following script is used to run at first boot and sets a random schedule for a daily InfraSonor update.

```bash title="/home/sysadmin/init"
#!/usr/bin/env bash
# Fix removed SSH host keys
# Note: this requires the use of sudo without password
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

### Avoid duplicate SSH host keys

To avoid lingering duplicate SSH host keys, we remove them before converting the appliance into a template.

```
sudo rm /etc/ssh/ssh_host_* 
```


### Avoid duplicate machine ID's

See also [this](https://kb.vmware.com/s/article/82229) VMware knowledge base article.

Before cloning, run these commands inside the Linux Guest OS:

```
sudo -s
echo -n > /etc/machine-id
rm /var/lib/dbus/machine-id
ln -s /etc/machine-id /var/lib/dbus/machine-id
```

### First login


### first boot


#### Change hostname

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


TODOR

```bash
# Expire the sysadmin password enforcing the user to change the password at logon
passwd -e sysadmin
```


### Cleanup

Remove the history

```bash
history -c
```

### Shutdown

```bash
sudo shutdown -h now
```

### Export the appliance: 

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