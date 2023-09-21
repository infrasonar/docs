![UniFi-Probe](../../images/probe_unifi.png){ width="150" align=right}

# UniFi

## Introduction

The UniFi controller probe uses the UniFi API to collect data from the UniFi controller.

!!! note "See also our UniFi SNMP probe"
    When you have no controller you can also use our [UniFi SNMP probe](./snmp/unifi.md) to access UniFi devices directly.

## Features

## Deployment

Ensure the following section is added to your :material-docker: [docker-compose](./appliance/docker-compose.yml) template to enable the UniFi controller probe and UniFi device probe:

```yaml
   unificontroller-probe:
     << : *infrasonar
     image: ghcr.io/infrasonar/unificontroller-probe
   unifidevice-probe:
     << : *infrasonar
     image: ghcr.io/infrasonar/unifidevice-probe
```

## Probe configuration

### Credentials

The UniFi controller and UniFi device probe use the same read-only credentials to access the UniFi API.

Use the following sections in our credentials file:

```yaml
unificontroller:
  config:
    password: "username"
    username: "pasword goes here"
unifidevice:
  use: unificontroller
```

See our [credentials documentation](./appliance/credentials.md) for more detailed information.

### Asset configuration

Ensure the UniFi Controller probe is setup and returning data before adding UniFi devices as you need information retrieved by the UniFi controller to setup the UniFi devices.

#### Controller

1. Start by adding an asset for the controller
2. Next set kind to **UniFi** in the *General* section
3. Add the **unificontroller** collector
4. Open the **unificontroller** collector configuration tab
      1. Enter the **address** (IP or FQDN) of the UniFi controller
      2. Ensure the correct **port** is set
      3. Set the **site** name.

#### UniFi devices

1. Start by adding an asset for the UniFi device
2. Next set kind to **UniFi** in the *General* section
3. Add the **unifidevice** collector
4. Open the **unifidevice** collector configuration tab
      1. Enter the **address** (IP or FQDN) of the UniFi controller
      2. Ensure the correct **port** is set
      3. Set the **site** name.
      4. Enter the MAC address of the UniFi 

You can automate this step using our toolkit and UniFi devices report.

Please reach out to [support](../../introduction/support.md) for additional information.

## Additional information

:material-github: [UniFi Controller probe](https://github.com/infrasonar/unificontroller-probe)<br>
:material-github: [UniFi Device probe](https://github.com/infrasonar/unifidevice-probe)