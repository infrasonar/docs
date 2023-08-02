![VMware](../../../images/probe_vmware.png){ width="150" align=right}

# VMware ESXi local account

This instruction is provided as is and is not supported in any way.

Read this script carefully and ensure you understand what it is doing.

## Prerequisites

This script is created to be run on a Linux host with an installed `esxcli`

## Script

```bash
#!/bin/bash

# Provide a list of ESXi hosts
declare -a esxhosts=("192.168.13.200" "192.168.13.201" "192.168.13.202")

# Ensure to enter the local admin user, usually this is root
admin_user="root"
# Enter the password for the local admin user
admin_password="Enter the root password here"

# We suggest using infrasonar as the local account but feel free to pick any other
infrasonar_user="infrasonar"
# ensure this password meets the ESXi Password policy
infrasonar_password="Enter the password you want to use for your infrasonar service account here"

# Iterate the string array using for loop
for esxhost in ${esxhosts[@]}; do
  # First step is to retrieve the thumbprint from the remote host as it is required for further login
  tumbnail=$(esxcli -s $esxhost -u $admin_user -p $admin_password system | sed 's/thumbprint: /#/g' | cut -f 2 -d "#" | cut -f 1 -d "(")
  echo processing $esxhost with thumbnail: $tumbnail
  # Second step is to create the actual user
  esxcli -s $esxhost \
  -u $admin_user \
  -p $admin_password \
  --thumbprint $tumbnail \
  system account add \
    -i $infrasonar_user \
    -p $infrasonar_password \
    -c $infrasonar_password
done
```

!!! danger "Remove script after use"

    This script contains readable usernames and passwords.
    Ensure to store and execute this on a trusted system!
    Also ensure the script is removed after use.