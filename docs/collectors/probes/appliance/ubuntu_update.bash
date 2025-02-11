#!/bin/bash

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
