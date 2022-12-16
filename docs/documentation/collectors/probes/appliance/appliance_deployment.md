# InfraSonar Appliance

## Getting started

We strongly advise to set up a dedicated (virtual) Linux :fontawesome-brands-linux: appliance for InfraSonar.

This appliance can be set up manually using [this](appliance_installation.md) guide or by downloading our ready-to-run OVA (Open Virtual Appliance) [here](https://storage.googleapis.com/oversight_repository/appliance/oversight-appliance.ova).

## Initialization

Initializing the InfraSonar appliances consists of three steps:

1. Change the default `sysadmin` password. (`0versight!`)
2. Configure the network stack.
3. Set the environment variables in the compose file.

All these steps can be performed via an SSH shell and a text editor such as [Nano](https://www.nano-editor.org).

### Remote management 

InfraSonar runs in Docker containers on Linux. Access is possible through the console in your virtualization solution. But a more straightforward approach is to use [SSH](https://linuxhandbook.com/ssh-basics/).

### SSH access

Modern desktop operating systems have the *ssh* command as part of their terminal. Alternatively, you can download and use [PuTTY](https://www.putty.org/).

SSH access is granted to the `sysadmin` user.

### Nano basics

The InfraSonar appliance configuration requires you to edit files using SSH access. The appliance includes the main text editors of **vi** and **nano**.

Since Nano is easier to use, we outline its essential functions here.

In this example, we create a `defaultCredentials.ini` file for the [WMI-probe](../probes/wmi/). See the [credentials section](credentials.md) for more in-depth information regarding credential files.

The easiest way to use Nano, is to open the file you want to edit or create directly using Nano, like this:

```bash
sudo nano /etc/infrasonar/config/wmiprobe/defaultCredentials.ini
```

!!! note SSH access assumed
    We assume you are logged on to the appliance using SSH.

This command will launch the Nano editor, where you can immediately make changes to the file:

<figure markdown>
  ![NanoScreenshot](../../../../images/nano_screenshot.png)
  <figcaption>Nano screenshot</figcaption>
</figure>

When your edits are done, exit using ++ctrl+x++. Nano now prompts if you want to **Save modified buffers**.

If you want to save your edits press ++y++, followed by an ++enter++ to confirm the filename.

Press ++n++ if you want to discard your edits or ++ctrl+c++ if you want to continue editing.

### Change password

Change the `sysadmin` password and keep it safe.

Login to the appliance using SSH or via virtual machine console and use the `passwd` command to set the password.

```bash
$ passwd
Changing password for sysadmin.
Current password:
New password:
Retype new password:
passwd: password updated successfully
```

### Network configuration

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

**Apply netplan**

Apply the netplan configuration using the following command:

```bash
$ sudo netplan apply
```

## Starting InfraSonar

For each InfraSonar appliance, the `TOKEN` must be set in the `/etc/infrasonar/docker-compose.yml` file.

See our [token documentation](../../../application/tokens.md) on how to retrieve a token.
    
When a token set, you can start the appliance using the following `docker compose` command:

```bash
docker compose -f /etc/infrasonar/docker-compose.yml pull
docker compose -f /etc/infrasonar/docker-compose.yml up -d
```

!!! note "docker-compose.yml details"
    Detailed documentation about the docker-compose.yml file in use by InfraSonar can be found [here](appliance_docker_compose.md).

When the Docker environment is up and running, you should see the agentcore as a host in your environment.
[Contact InfraSonar support](../../../introduction/contact_us.md) if you require any assistance.

## Monitor the appliance

Since InfraSonar is a monitoring platform, the first thing to do is monitor the appliance using the SNMP-probe.

TODO

