#!/bin/bash

# Variables

## make the script look prettier 
bold=$(tput bold)
normal=$(tput sgr0)

## Script filename automatic ubuntu updates
update_script=/root/ubuntu_update.bash

# Startup message
echo -e
echo "${bold}InfraSonar install script${normal}"
echo  "${bold}=========================${normal}"

if [[ "$(id -u)" -ne 0 ]]; then
  echo "This script must be run as root."
  exit 1
fi


# Install all Ubuntu updates
sudo apt update
sudo apt upgrade -y -q

# Install additional packages
sudo apt install -y -q vim nano cron dnsutils snmp iputils-ping curl snmpd jq

#Configure snmpd

sed -i 's/rocommunity  public default -V systemonly/rocommunity  public default/' /etc/snmp/snmpd.conf
sed -i 's/rocommunity6 public default -V systemonly/rocommunity  public default/' /etc/snmp/snmpd.conf
service snmpd restart

# Install docker
sudo curl -sSL https://get.docker.com | bash


# Configure Ubuntu auto updates

## retrieve the update script
curl -sL https://docs.infrasonar.com/collectors/probes/appliance/ubuntu_update.bash -o $update_script

## Ensure the update script is executable
sudo chmod +x $update_script

## Run the update script every day at 2.00 am
sudo env update_script="$update_script" sh -c '(crontab -l ; echo "0 2 * * * $update_script") | crontab -'



# InfraSonar installer
## create a temporary folder and make this the working directory
cd $(mktemp -d)

## Download the latest InfraSonar appliance installer
curl -sL $(curl -s https://api.github.com/repos/infrasonar/appliance-installer/releases/latest | jq -r '.assets[] | select(.name | contains ("linux")) | .browser_download_url') -o appliance-installer-linux-amd64.tar.gz


## Unpack the InfraSonar appliance installer
tar -xzvf appliance-installer-linux-amd64.tar.gz

## Run the InfraSonar appliance installer
sudo ./appliance-installer

exit 0