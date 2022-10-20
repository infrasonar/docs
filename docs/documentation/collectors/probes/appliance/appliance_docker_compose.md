# :material-docker: Docker

InfraSonar probes and the InfraSonar Agent-core are distributed using Docker containers. 

This section outlines this [docker-compose](https://docs.docker.com/compose/) setup.

## Data location

We opt to store all InfraSonar related data and configuration in one directory, preferably in `/etc/infrasonar`.

## Docker compose file

The docker-compose file below can be used to deploy all currently available probes and an Agent-core. 

```yaml title="/etc/infrasonar/docker-compose.yml"
x-infrasonar-template:
  &infrasonar
  network_mode: host
  restart: always
  logging:
    options:
      max-size: 5m
  volumes:
      - ./config:/data/config

services:
  agentcore:
    << : *infrasonar
    image: ghcr.io/cesbit/osagentcore
    environment:
      OS_CUSTOMER_UUID: "d794e0cdd700"

  pingprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar/pingprobe

  httpprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar/httpprobe
  
  dnsprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar/dnsprobe
  
  tcpprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar/tcpprobe

  snmpprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar/snmpprobe

  wmiprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar/wmiprobe

  mssqlprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar/mssqlprobe

  vmwareprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar/vmwareprobe

  netappprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar/netappprobe

  pureprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar/pureprobe

  smtpprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar/smtpprobe

  # dockeragent:
  #   << : *infrasonar
  #   image: ghcr.io/infrasonar/dockeragent
  #   environment:
  #     OSDA_ENVIRONMENT_UUID: "xxxxxxxxxxxx"
  #     OSDA_TOKEN: "my super secret token"
  #     OSDA_API_URI: "https://api.infrasonar"
  #     OSDA_HOST_UUID: "xxxxxxxxxxxx-yyyyyyyyyyyy"
  #   volumes:
  #     - /var/run/docker.sock:/var/run/docker.sock
```

### Section outline

#### x-infrasonar-template

The `x-infrasonar-template` section ensures the default settings are the same for all InfraSonar containers.

#### Agent-core service

The Agent-core service contains an environment variable that must be set correctly prior to starting the InfraSonar environment.
See the [operational guide](appliance_deployment.md) on how to determine the correct variable.


!!! Warning "Legacy settings"
    Setting the variable `OS_AGENTCORE_LISTEN_IP: "0.0.0.0"` should be avoided and only used for legacy setups that use the "old" Agent-core API.
    Our probes are configured to connect to `agentcore` using `localhost`.

#### services

We strive to use a default `environment` for all probes, but sometimes you might want to change the log level for a probe. The example below outlines how to enable this:

```yaml title="/etc/infrasonar/docker-compose.yml" hl_lines="4 5"
  wmicprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar//wmicprobe
    environment:
      OS_LOG_LEVEL: "debug"
```

The full list of supported environment variables can be found in the Agent-core client library [documentation](https://github.com/infrasonar/agentcoreclient#supported-environment-variable).
