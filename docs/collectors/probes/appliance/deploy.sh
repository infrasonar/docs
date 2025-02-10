#!/bin/bash

# Variables

## make the script look prettier 
bold=$(tput bold)
normal=$(tput sgr0)

## Script filename automatic ubuntu updates
file_location=/root/ubuntu_update.bash

# Startup message
echo -e
echo "${bold}InfraSonar install script${normal}"
echo  "${bold}=========================${normal}"


# Allow sudo without password
echo "$USER ALL=(ALL:ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/$USER

# Install all Ubuntu updates
sudo apt update
sudo apt upgrade -y -q

# Install additional packages
sudo apt install -y -q vim nano cron dnsutils snmp iputils-ping curl wget snmpd tmate jq

# Install docker
sudo curl -sSL https://get.docker.com | bash


# Configure Ubuntu auto updates
if [ -e $file_location ]; then
  echo "File $file_location already exists!"
else
  cat > $file_location <<EOF
#!/bin/bash

# Set the time for the update (2:00 AM)
UPDATE_TIME="02:00"

# Log file for updates
LOG_FILE="/var/log/ubuntu_automatic_updates.log"

# Function to perform the updates
perform_updates() {
  echo "$(date): Starting automatic updates..." >> "$LOG_FILE"

  # Update package lists
  apt update >> "$LOG_FILE" 2>&1

  # Upgrade installed packages (including new packages if needed)
  apt upgrade -y >> "$LOG_FILE" 2>&1

  # Dist-upgrade to handle distribution upgrades if available (use cautiously)
  # apt dist-upgrade -y >> "$LOG_FILE" 2>&1  # Uncomment if you want dist-upgrades

  # Autoremove to remove unused packages
  apt autoremove -y >> "$LOG_FILE" 2>&1

  # Autoclean to remove old downloaded package files
  apt autoclean -y >> "$LOG_FILE" 2>&1

  # Check if a reboot is required
  if [ -f /var/run/reboot-required ]; then
    echo "$(date): Reboot required. Rebooting..." >> "$LOG_FILE"
    # Remove the lock file
    rm /tmp/ubuntu_automatic_updates.lock
    reboot
  else
    echo "$(date): No reboot required." >> "$LOG_FILE"
  fi

  echo "$(date): Automatic updates completed." >> "$LOG_FILE"
}


# Check if the script is already running
if [ -f /tmp/ubuntu_automatic_updates.lock ]; then
  echo "$(date): Automatic updates already running. Exiting." >> "$LOG_FILE"
  exit 1
fi

# Create a lock file
touch /tmp/ubuntu_automatic_updates.lock

# Perform the updates
perform_updates

# Remove the lock file
rm /tmp/ubuntu_automatic_updates.lock

exit 0
EOF

## Ensure the update script is executable
sudo chmod +x $file_location

## Run the update script every day at 2.00 am
sudo env file_location="$file_location" sh -c '(crontab -l ; echo "0 2 * * * $file_location") | crontab -'
fi

# InfraSonar installer
## create a temporary folder and make this the working directory
cd $(mktemp -d)

## Download the latest InfraSonar appliance installer
wget -q -O appliance-installer-linux-amd64.tar.gz $(wget -q -O - https://api.github.com/repos/infrasonar/appliance-installer/releases/latest  |  jq -r '.assets[] | select(.name | contains ("linux")) | .browser_download_url')

## Unpack the InfraSonar appliance installer
tar -xzvf appliance-installer-linux-amd64.tar.gz

## Run the InfraSonar appliance installer
sudo ./appliance-installer



