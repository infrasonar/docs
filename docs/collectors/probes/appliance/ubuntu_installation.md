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
    3.  Pick a username: *sysadmin*.
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


_If you don't want to use our script you can follow [this](./ubuntu_installation_manual.md) guide to perform each stap manually ._


Follow the prompts from the installer, this will look something like this:

```
Installation Path (enter path or press Enter for default: /etc/infrasonar)
Do you want to allow users with CoreConnect permissions to start remote access (recommended)? (yes/no)
<yes>
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

After this step a new [agentcore](../../../application/agentcores.md) will appear in your InfraSonar UI