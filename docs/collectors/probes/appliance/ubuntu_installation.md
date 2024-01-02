# Appliance

This section outlines how to install the :fontawesome-brands-linux: Linux appliance from scratch.

## Installation

:material-ubuntu: Ubuntu Server 22.04 LTS is used as the basis for the InfraSonar appliance.

When using a virtual machine we suggest using these specifications:

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
4. Network configuration: **choose the appropriate network configuration for your environment**
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
    2.  Import SSH identity: **Usually no, but feel free to enter your own**.
12. Featured Server Snaps: do not select any server snaps.
13. If the installation is ready, select: **Reboot now**.

## Post installation steps

Login to the appliance using SSH to perform the *post installation* steps.

```
ssh sysadmin@<server-ip>
```

### Upgrade

update and upgrade your Ubuntu installation so we are current before proceeding.

```bash 
sudo apt update
sudo apt upgrade
sudo reboot
```

### VMware tools

*:material-information: Optional*

When running on a VMware hypervisor it is recommended to install [open-vm-tools](https://github.com/vmware/open-vm-tools).

```bash 
# Update the APT package index.
sudo apt update
# Install open VMware tools.
sudo apt install -y open-vm-tools
```

### sudo configuration

We opt to allow command to be executed using sudo without asking for a password.

```bash
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER
```

### Miscellaneous tools

```bash
sudo apt install -y vim nano cron dnsutils snmp iputils-ping curl python3 pip snmpd tmate
```

The above command installs a list of useful tools:

* *[vim](https://www.vim.org/)*, VI text editor.
* *[nano](https://www.nano-editor.org/)*, text editor.
* *[cron](https://crontab.guru/)*, task schedular. 
* *dnsutils*, handy tool for debugging dns issues.
* *snmp*, snmpd daemon used to monitor the Linux operating system.
* *iputils-ping*, tools for debugging network issues.
* *[curl](https://curl.se/)*, command-line downloader
* *[python3](https://python.org/)*, python programming language, used by the appliance manager.
* *[pip](https://pypi.org/project/pip/)*, python package installer, used by the appliance manager.
* *[tmate](https://tmate.io/)*, teamviewer like solution used to offer remote support on request.

#### SNMPD

As we use the default community string `public` and only require the snmpd daemon to listen on `localhost`, no further configuration is required.

```
# Read-only access to everyone to the systemonly view
rocommunity  public default
rocommunity6 public default -V systemonly
```

### Docker installation

All InfraSonar components run as Docker containers and are orchestrated using docker-compose.

The official Docker engine installation instructions can be found [here](https://docs.docker.com/engine/install/ubuntu/).

```bash
sudo curl -sSL https://get.docker.com | bash
```

### InfraSonar appliance manager

You can install the [appliance manager](https://github.com/infrasonar/appliance-manager) using the following command:

```bash
sudo pip install infrasonar-appliance
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


### InfraSonar

The easiest way to deploy InfraSonar is using our [appliance manager](./appliance_manager.md)

It is however also possible to install InfraSonar manually using docker, see our [advanced](.//advanced.md) section.