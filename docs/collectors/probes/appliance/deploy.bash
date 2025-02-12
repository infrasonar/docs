#!/bin/bash

# Function to re-run the script with sudo
run_as_root() {
  echo "This script requires root privileges. Please enter your password when prompted."
  sudo "$0" "$@"  # Re-run the script with sudo. "$@" passes all arguments.
  exit $? # Exit with the same status code as sudo.
}

# Prompt user for sudo if not root.
if [[ "$UID" -ne 0 ]]; then
  run_as_root
fi

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

# Install all Ubuntu updates
sudo apt update
sudo apt upgrade -y -q

# Install additional packages
sudo apt install -y -q vim nano cron dnsutils snmp iputils-ping curl wget snmpd tmate jq

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