# :material-docker: Docker deployment

InfraSonar probes and the InfraSonar agentcore are distributed using Docker containers via [docker compose](https://docs.docker.com/compose/).

## Data location

We opt to store the InfraSonar related data and configuration in the same sub-directory `data` in the directory where the docker compose file lives.

## Docker compose file

The docker-compose file below can be used to deploy all currently available probes and an agentcore. 

```yaml title="docker-compose.yml" hl_lines="21 26"
## InfraSonar docker-compose.yml file
##
## Set the correct TOKEN variables before starting.

x-infrasonar-template: &infrasonar
  network_mode: host
  restart: always
  logging:
    options:
      max-size: 5m
  volumes:
      - ./data:/data/
  labels:
    com.centurylinklabs.watchtower.enable: TRUE

services:
  agentcore:
    << : *infrasonar
    image: ghcr.io/infrasonar/agentcore
    environment:
      TOKEN: "Agentcore-token»"
  docker-agent:
    << : *infrasonar
    image: ghcr.io/infrasonar/docker-agent
    environment:
      TOKEN: "«Agent-token»"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./data:/data/
  # Auto Update service
  watchtower:
    image: containrrr/watchtower
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /etc/localtime:/etc/localtime:ro
    environment:
      WATCHTOWER_CLEANUP: TRUE
      WATCHTOWER_INCLUDE_RESTARTING: TRUE
      WATCHTOWER_POLL_INTERVAL: 43200
      WATCHTOWER_LABEL_ENABLE: TRUE
  # InfraSonar probes
  dns-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/dns-probe
  eaton-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/eaton-probe
  esx-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/esx-probe
  hpilo-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/hpilo-probe
  hpprocurve-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/hpprocurve-probe
  esx-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/esx-probe
  http-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/http-probe
  mssql-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/mssql-probe
  netapp-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/netapp-probe
  paloalto-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/paloalto-probe:unstable
  ping-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/ping-probe
  snmp-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/snmp-probe
  santricity-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/santricity-probe
  synology-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/synology-probe
  tcp-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/tcp-probe
  unifi-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/unifi-probe
  vcenter-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/vcenter-probe
  wmi-probe:
    << : *infrasonar
    image: ghcr.io/infrasonar/wmi-probe

```

### Section outline

#### x-infrasonar-template

The `x-infrasonar-template` section ensures the default settings are the same for all InfraSonar containers.

#### Agentcore service

The agentcore service contains an environment variable containing a TOKEN that must be set correctly prior to starting the InfraSonar environment.
See the [tokens section](../../../application/tokens.md) on how to determine the correct variable.


#### Docker agent

The Docker agent contains an environment variable containing a TOKEN that must be set correctly prior to starting the InfraSonar environment.
See the [tokens section](../../../application/tokens.md) on how to determine the correct variable.


#### Watchtower service

We use [Watchtower](https://containrrr.dev/watchtower/) to periodicity check for updates.

Within the Watchtower service we mount the localtime file to ensure the container is running in the same timezone as the appliance.

Next we configured the following envrionment variables:

* `WATCHTOWER_CLEANUP: TRUE`<br>
  Removes old images after updating. When this flag is specified, watchtower will remove the old image after restarting a container with a new image. Use this option to prevent the accumulation of orphaned images on your system as containers are updated.
* `WATCHTOWER_INCLUDE_RESTARTING: TRUE`<br>
  We include restarting containers as an update might fix the issue causing this.
* `WATCHTOWER_POLL_INTERVAL: 43200`<br>
  We check every 12 hours for updates
* `WATCHTOWER_LABEL_ENABLE: TRUE`<br>
  We only update the containers with the label `com.centurylinklabs.watchtower.enable` set to true.<br>
  We set this label in our template to ensure it is enabled for all hosts.


## Manual update

Login using SSH and use the [cd](https://en.wikipedia.org/wiki/Cd_(command)) command to navigate to the directory containing the InfraSonar `docker-compose.yml` file.


```bash
# Look for newer images and pull these
docker compose pull
# Reload any changed images
docker compose up -d
```

## Restart

If you want to restart all InfraSonar containers you can do so using the following command:

```bash
docker compose restart
```

This implies you are executing this command in the directory containing the InfraSonar `docker-compose.yml` file.

## Logging

For troubleshooting purposes you can change the log-level in the `docker-compose.yml` file

Supported log levels:

* debug
* info
* warning
* error
* critical


```yaml title="docker-compose.yml" hl_lines="16 17 25 26  32 33" linenums="1"
## InfraSonar docker-compose.yml file
##
## Set the correct TOKEN variables before starting.

x-infrasonar-template: &infrasonar
  network_mode: host
  restart: always
  logging:
    options:
      max-size: 5m
  volumes:
      - ./data:/data/
  labels:
    com.centurylinklabs.watchtower.enable: TRUE
  environment:
    LOG_LEVEL: "debug"
    LOG_COLORIZED: "1"

services:
  agentcore:
    << : *infrasonar
    image: ghcr.io/infrasonar/agentcore
    environment:
      TOKEN: "Agentcore-token»"
      LOG_LEVEL: "debug"
      LOG_COLORIZED: "1"
  docker-agent:
    << : *infrasonar
    image: ghcr.io/infrasonar/docker-agent
    environment:
      TOKEN: "«Agent-token»"
      LOG_LEVEL: "debug"
      LOG_COLORIZED: "1"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - ./data:/data/
  .....
```

!!! note
    You need to restart you containers for changed log setting to become active.