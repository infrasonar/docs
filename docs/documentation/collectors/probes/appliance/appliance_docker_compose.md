# :material-docker: Docker

InfraSonar probes and the InfraSonar agentcore are distributed using Docker containers. 

This section outlines this [docker-compose](https://docs.docker.com/compose/) setup.

## Data location

We opt to store all InfraSonar related data and configuration in one directory, preferably in `/etc/infrasonar`.

## Docker compose file

The docker-compose file below can be used to deploy all currently available probes and an agentcore. 

```yaml title="/etc/infrasonar/docker-compose.yml"
x-infrasonar-template:
  &infrasonar
  network_mode: host
  restart: always
  logging:
    options:
      max-size: 5m
  volumes:
      - ./data:/data/

services:
  agentcore:
    << : *infrasonar
    image: ghcr.io/infrasonar/agentcore
    environment:
      TOKEN: "<<agentcore-token>>"

  pingprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar/ping-probe

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
  
  dockeragent:
    << : *infrasonar
    image: ghcr.io/infrasonar/docker-agent
    environment:
      TOKEN: "<<agent token>>"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

### Section outline

#### x-infrasonar-template

The `x-infrasonar-template` section ensures the default settings are the same for all InfraSonar containers.

#### Agentcore service

The gentcore service contains an environment variable containing a TOKEN that must be set correctly prior to starting the InfraSonar environment.
See the [tokens section](../../../application/tokens.md) on how to determine the correct variable.