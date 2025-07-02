#!/bin/bash

# --- Variables ---

install_dir="/opt/infrasonar-linux-agent"
config_dir="/etc/infrasonar"
package_name="linux-agent"
binary_name="infrasonar-linux-agent"
github_repo="infrasonar/linux-agent"
systemd_unit_file="/etc/systemd/system/infrasonar-linux-agent.service"

log_info() {
  echo "[INFO] $1"
}

log_error() {
  echo "[ERROR] $1" >&2
}

check_root() {
  if [[ "$EUID" -ne 0 ]]; then
    log_error "This script requires root privileges. Please run with sudo."
    exit 1
  fi
}

check_systemd() {
  if ! command -v systemctl &> /dev/null; then
    log_error "systemd is not available on this system.  This script requires systemd."
    exit 1
  fi
}

create_directory() {
  local dir_path="$1"
  if [ ! -d "$dir_path" ]; then
    log_info "Creating directory '$dir_path'..."
    mkdir -p "$dir_path"
  else
    log_info "Directory '$dir_path' already exists."
  fi
}

download_agent() {
  # Fetch the latest release info from GitHub API
  response=$(curl -s "https://api.github.com/repos/"$github_repo"/releases/latest")

  # Extract the download URL for the Linux asset using grep and sed
  download_url=$(echo "$response" | grep '"browser_download_url":' | sed -n "/$package_name/p" | sed 's/.*"browser_download_url": "//' | sed 's/".*//')
  
  # Check if a URL was found
  if [ -n "$download_url" ]; then
    # Download the file
    curl -sL "$download_url" -o $install_dir/$binary_name
    chmod +x $install_dir/$binary_name
    log_info "Successfully downloaded $binary_name"
  else
    log_error "Error: Could not find a suitable download URL for Linux."
    exit 1
  fi
}

create_config() {
  if [ -f "$config_dir/linux-agent.env" ]; then
    log_info "Configuration file already exists."
  else
    log_info "Configuration file does not exist."
    # Create configuration directory
    create_directory "$config_dir"
    # Ask for token
    read -p "Please enter your token: " token
    echo "TOKEN=$token" >"$config_dir/linux-agent.env"
    # Ask for optional asset ID
    read -p "Add asset token, leave empty for auto creation: " assetid
    if [[ -n "$assetid" ]]; then
      echo "ASSET_ID=$assetid" >> "$config_dir/linux-agent.env"
    fi
    log_info "Created config file '$config_dir/linux-agent.env'..."
  fi
}

create_systemd_unit() {
    log_info "Creating systemd unit file '$systemd_unit_file'..."
    cat <<EOF > "$systemd_unit_file"
[Unit]
Description=InfraSonar Linux Agent
Wants=network.target

[Service]
WorkingDirectory=$install_dir
EnvironmentFile=$config_dir/linux-agent.env
ExecStart=$install_dir/$binary_name
Restart=on-failure

[Install]
WantedBy=multi-user.target
EOF
}

enable_and_start_service() {
  log_info "Enabling and starting the InfraSonar Linux agent service..."
  systemctl enable infrasonar-linux-agent
  systemctl start infrasonar-linux-agent
  if [ $? -ne 0 ]; then
    log_error "Failed to start the InfraSonar Linux agent service. Check systemctl status InfraSonar-linux-agent for details."
  else
    log_info "Infrasonar agent service started successfully."
  fi
}

# --- Main Script ---

check_root
check_systemd # added systemd check
create_directory "$install_dir"
create_config
download_agent
create_systemd_unit
enable_and_start_service

log_info "InfraSonar Linux agent deployment complete."
