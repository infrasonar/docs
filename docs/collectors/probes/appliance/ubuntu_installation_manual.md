# :fontawesome-brands-linux: Manual InfraSonar installation

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
sudo apt install -y vim nano cron dnsutils snmp iputils-ping curl snmpd jq
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

Follow the prompts from the installer.