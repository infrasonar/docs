# Appliance maintenance

As the InfraSonar appliance updates itself it requires almost no maintenance.

## Manual update

If you want to update your InfraSonar components manually you can do so using the following commands:


```bash
# Look for newer images and pull these
docker compose -f /etc/infrasonar/docker-compose.yml pull
# Reload any changed images
docker compose -f /etc/infrasonar/docker-compose.yml up -d
```

## Restarting InfraSonar

If you want ro restart all InfraSonan containers you can do so using the following command:

```bash
docker compose -f /etc/infrasonar/docker-compose.yml restart
```

## Logging

For troubleshooting purposes you can change the loglevel in the `/etc/infrasonar/docker-compose.yml ` 

Supported log levels:

* debug
* info
* warning
* error
* critical


```yaml title="/etc/infrasonar/docker-compose.yml" hl_lines="17 18 24 25"
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
      TOKEN: "<your-token>"
      LOG_LEVEL: "debug"
      LOG_COLORIZED: "1"

  pingprobe:
    << : *infrasonar
    image: ghcr.io/infrasonar/ping-probe
    environment:
      LOG_LEVEL: "debug"
      LOG_COLORIZED: "1"
```

!!! note
    You need to restart you containers for changed log setting to become active.
