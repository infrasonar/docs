![TCP](../../images/probe_tcp.png){ width="150" align=right}

# TCP

## Introduction

The TCP probe uses Nmap to try and make a TCP connection to specified TCP ports.

## Features

* Check TCP ports
* Check certificates

## Probe configuration

Property          | Description
------------------|------------------------
Address           | The address that the probe should check.
Certificate Ports | List of ports to perform certificates check on.
TCP Ports         | List of ports to perform a port check on.<br>Each port must be a numeric value between 1 and 65535, where ports are separated by a comma.

## Checks

### TCP ports

Check TCP ports allows for monitoring specific TCP port statuses.

As the TCP probe uses NMAP at its core it can identify the same six ports states as Nmap.

Port state        | Description
------------------|----------------------------------------
`open`            | An application is actively accepting TCP connections, UDP datagrams or SCTP associations on this port.
`closed`          | A closed port is accessible (it receives and responds to Nmap probe packets), but there is no application listening on it.
`filtered`        | Nmap cannot determine whether the port is open because packet filtering prevents its probes from reaching the port. The filtering could be from a dedicated firewall device, router rules, or host-based firewall software.
`unfiltered`      | The unfiltered state means that a port is accessible, but Nmap is unable to determine whether it is open or closed.
`open|filtered`   | Nmap places ports in this state when it is unable to determine whether a port is open or filtered.
`closed|filtered` | This state is used when Nmap is unable to determine whether a port is closed or filtered.

### Certificates

* Gathers certificates and ciphers present on the specified TCP port.
* Shows expiration date.
* Shows the least overall strength per certificate.

## Additional information

:material-github: [TCP probe source code](https://github.com/infrasonar/tcp-probe)