![TCP](../../images/probe_tcp.png){ width="150" align=right}

# TCP

## Introduction

The TCP-service is the [service](./index.md) variant of our [tcp-probe](../probes/tcp.md).

## Features

- Check certificates

## Service configuration

| Property          | Description                                                                                                                               |
| ----------------- | ----------------------------------------------------------------------------------------------------------------------------------------- |
| Address           | The address that the probe should check.                                                                                                  |
| Certificate Ports | List of ports to perform certificates check on.                                                                                           |

## Checks

### Certificates

Gathers certificates and ciphers present on the specified TCP port.