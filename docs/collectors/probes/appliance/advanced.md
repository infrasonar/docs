# Advanced guide

!!! danger "Use with care!!"

    Use our advanced guide with caution, it is aimed at experienced InfraSonar users and those with extensive knowledge about Linux and docker.

## :material-docker: Docker deployment

InfraSonar probes and the InfraSonar Agentcore are distributed using Docker containers via [docker compose](https://docs.docker.com/compose/).

InfraSonar requires docker compose V2 or newer.

This section outlines our best practices.

### Directory structure

We prefer to use `/etc/infrasonar` as the main directory but this is not required.

You can determine the directory used on your appliance using the `docker compose ls` command.

file / directory                                  | Remark
--------------------------------------------------|------------------------------
[.env](#env-file)                                 | This file contains the InfraSonar tokens and is used by the `docker-compose.yml` file
[docker-compose.yml](#docker-compose-file)        | Contains alle InfraSonar probes as services next to the [agentcore](../agentcore.md) and watchtover service
/data                                             | data volume, mounted to all InfraSonar services to store their config
/data/.agentcore.json                             | Agentcore configuration 
/data/.asset.json                                 | Docker agent configuration
/data/config                                      | Contains probe specific configuration files
[/data/config/infrasonar.yaml](./credentials.md)  | Contains probe specific configuration such as credentials.


#### .env file

The `.env` file contains the agentcore token, agent token and zone ID.

```
AGENTCORE_TOKEN = <<agentcore token>>
AGENT_TOKEN = <<agent token>>
AGENTCORE_ZONE_ID = 0
```

See our [token documentation](../../../application/tokens.md) on how to create tokens.

#### Docker compose file

The latest production version of our complete `docker-compose.yml` file can be downloaded [here](./docker-compose.yml)

Some noteworthily sections of our `docker-compose.yml` file:

*Volumes*

:   We opt to store the InfraSonar related data and configuration in the same sub-directory `data` in the directory where the docker compose file lives.

*Networking*

:   We use the host network for all our containers and thus probes to avoid any networking issues.

*x-infrasonar-template section*

:   The `x-infrasonar-template` section ensures the default settings are the same for all InfraSonar containers.

*Watchtower service*

:   We use [Watchtower](https://containrrr.dev/watchtower/) to periodicity check for updates.

    Within the Watchtower service we mount the localtime file to ensure the container is running in the same timezone as the appliance.


## Docker maintenance  

### Manual update your docker containers

Login using SSH and navigate to the directory containing the InfraSonar configuration. (usually this is `/etc/infrasonar/`)

The first step is to check for newer images and pull these using this command:

```bash
docker compose pull
```

If all new images are downloaded you can apply the changes using:
```bash
docker compose up -d
```

### Restart

If you want to restart all InfraSonar containers you can do so using the following command:

```bash
docker compose restart
```

This implies you are executing this command in the directory containing the InfraSonar `docker-compose.yml` file.

### Logging

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

[Contact InfraSonar support](../../../introduction/support.md) if you require any assistance.
