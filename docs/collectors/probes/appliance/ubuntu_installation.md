# :fontawesome-brands-linux: Appliance

This section outlines how to install our Ubuntu based  Linux appliance from scratch.

We opt to use Ubuntu in this guide. If you prefer to use any other distribution please contact [support](/docs/support/index.md) and discuss any pitfalls to be aware off.

## Prerequisites

To ensure an up to date Ubuntu installation but also for our monitoring solution internet access is required for the appliance.

Also note the appliance uses TCP port 8730 (TLS/SSL) to connect to our InfraSonar cloud Platform.

!!! note ""
    it is possible to use TCP port 443 instead of 8730 we don't recommended this but some environment refuse inter traffic to ports other then 80 and 443

_If your organization does not allow direct internet access please contact [support](/docs/support/index.md) to discuss alternative options._

## Hardware requirements

:material-ubuntu: Ubuntu Server 24.04 LTS is used as the basis for the InfraSonar appliance.

When using a virtual machine we suggest using these specifications:

* **CPU**: 2 CPU
* **Memory**: 2 GB memory
* **Disk**: 30 GB HDD
* **Name**: infrasonar-appliance

### VMWare specifics

* **Compatibility**: Compatible with: ESXi 6.5 and later VM version 13
* **Guest OS Family**: Linux
* **Guest OS Version**: Ubuntu Linux (64-bit) 

## Ubuntu Installation steps

You can download the required :material-ubuntu: Ubuntu Server 24.04 LTS ISO [here](https://ubuntu.com/download/server).

Boot from the Ubuntu Server 24.04 LTS ISO and then follow these steps:

1. First step is to **boot** from the Ubuntu ISO or from a [bootable USB stick](https://ubuntu.com/tutorials/create-a-usb-stick-on-ubuntu).
2. Select your language: **English**.
3. If prompted to to **update to the new installer** please do so.
4. Keyboard configuration: (_feel free to change to your situation_)
    1. Layout: **English (US)**.
    2. Variant: **English (US)**.
5. Choose the type of install: **Ubuntu server (minimized)**
6. Network configuration: **choose the appropriate network configuration for your environment**
7. Proxy address: enter a proxy address if your environment uses a proxy, otherwise leave empty.
8. Mirror address: **keep as it is**, *unless you know what you are doing*.
9. Guided storage configuration:
    1. Select: **Use an entire disk**.
    2. Deselect: **Set up this disk as an LVM group**.
10. Storage configuration:
   1. Review the file system summary and select: **Done**.
11. Confirm destructive action, by clicking: **Continue**.
12. Profile setup: (_feel free to pick your own username and server name_)
    1.  Your name: *sysadmin*.
    2.  Your server's name: *infrasonar-appliance*.
    3.  Pick a username: *sysdmin*.
    4.  Choose a password: <Pick your own strong password and store is safely>
    5.  Confirm your password: <Pick your own strong password and store is safely>
13. SSH Setup:
    1.  Select: **Install OpenSSH Server**.
    2.  Import SSH identity: **Usually no, but feel free to enter your own**.
14. Featured Server Snaps: do not select any server snaps.
15. If the installation is ready, select: **Reboot now**.

## InfraSonar installation steps

Login to the appliance using SSH to perform the *post installation* steps.

```bash
ssh sysadmin@<server-ip>
```

Note all steps below can be easily executed using our quick deploy script:

```bash
sudo /bin/bash -c "$(curl -fsSL https://deploy.infrasonar.com)"
```

!!! warning "Do not run this script on an existing Linux system"
    Our quick deploy script is meant to be used on a clean Ubuntu server installation.
    Using it on an existing system can cause unexpected results!

!!! Note "Curl command explanation"
    - `-L` to automatically follow redirects.
    - `-sS` to suppress the progress meter but still show error messages.
    - `-f` to treat an HTTP error as a command error. This is to ensure that no error message gets piped to `sh`, avoiding a potentially dangerous action.

## Manual InfraSonar installation

All steps outlined below our automated in our deploy script.

### Upgrade

First step is to update and upgrade your Ubuntu installation so we are current before proceeding.

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

### Miscellaneous tools

```bash
sudo apt install -y vim nano cron dnsutils snmp iputils-ping curl snmpd tmate jq
```

The above command installs a list of useful tools:

* *[vim](https://www.vim.org/)*, VI text editor.
* *[nano](https://www.nano-editor.org/)*, text editor.
* *[cron](https://crontab.guru/)*, task schedular. 
* *dnsutils*, handy tool for debugging dns issues.
* *snmp*, snmpd daemon used to monitor the Linux operating system.
* *iputils-ping*, tools for debugging network issues.
* *[curl](https://curl.se/)*, command-line downloader
* *[tmate](https://tmate.io/)*, teamviewer like solution used to offer remote support on request.

### SNMPD

As we use the default community string `public` and only require the snmpd daemon to listen on `localhost`, no further configuration is required.

Edit the `/etc/snmp/snmpd.conf` file to ensure access to all facilities:


``` title="/etc/snmp/snmpd.conf"
# Read-only access to everyone to the systemonly view
rocommunity  public default -V systemonly
rocommunity6 public default -V systemonly
```

Change the above section to:

``` title="/etc/snmp/snmpd.conf"
# Read-only access to everyone to the systemonly view
rocommunity  public default
rocommunity6 public default
```

Restart the snmpd service to make the changes effective:

```bash
service snmpd restart
```

### Docker installation

All InfraSonar components run as Docker containers and are orchestrated using docker-compose.

The official Docker engine installation instructions can be found [here](https://docs.docker.com/engine/install/ubuntu/).

```bash
sudo curl -sSL https://get.docker.com | bash
```

### Unattended updates

As we want the InfraSonar appliance to be zero maintenance, we configure unattended updates and allow the appliance to reboot when necessary at 2:00 CET.

Create the following script as `/root/ubuntu_update.bash`:

```bash title="ubuntu_update.bash"
--8<-- "collectors/probes/appliance/ubuntu_update.bash"
```

Add this script to crontab of user root like this:

```bash
sudo sh -c '(crontab -l ; echo "0 2 * * * /root/ubuntu_update.bash") | crontab -'
```

Note using `sudo crontab -e` you can edit the schedule to your liking.

### InfraSonar installer

Our InfraSonar installer is available on [GitHub](https://github.com/infrasonar/appliance-installer)

The following command ensure download and execution of our latest installer:



```bash
## Create and change into a temporary directory
cd $(mktemp -d)
## Download the latest InfraSonar appliance installer
curl -sL $(curl -s https://api.github.com/repos/infrasonar/appliance-installer/releases/latest | jq -r '.assets[] | select(.name | contains ("linux")) | .browser_download_url') -o appliance-installer-linux-amd64.tar.gz
## Unpack the InfraSonar appliance installer
tar -xzvf appliance-installer-linux-amd64.tar.gz
## Run the InfraSonar appliance installer
sudo ./appliance-installer
```


Follow the prompts from the installer, this will look something like this:

```
Installation Path (enter path or press Enter for default: /etc/infrasonar)

Please provide a token for the Agentcore (container token with `CoreConnect` permissions):
<your token appears here>
Please provide a token for the agents (container token with `Read`, `InsertCheckData`, `AssetManagement` and `API` permissions):
<your token appears here>

################################################################################

  The appliance for zone 0 will be deployed in the '/etc/infrasonar' directory

################################################################################

Do you want to continue? (yes/no)
yes
Please be patient, this may take a while...
```