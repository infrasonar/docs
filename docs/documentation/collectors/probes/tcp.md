# :material-ip-network-outline: TCP

## Features

The TCP probe consists of two checks:

* Check TCP port status
* Check certificates

## Configuration

Property          | Description
------------------|------------------------
Address           | The address that the probe should check.
Certificate Ports | List of ports to perform certificates check on.
TCP Ports         | List of ports to perform a port check on.

!!! Note "Ports"

    Each port must be a numeric value between 1 and 65535, where ports are separated by a comma.