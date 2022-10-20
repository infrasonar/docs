# :fontawesome-brands-docker: Docker

The Docker-agent is a Docker container that can be used to monitor other Docker containers. The Docker-agent itself runs as a Docker container on the host, which hosts the containers and uses the Unix socket `docker.sock` to retrieve relevant monitoring data which, is send to the InfraSonar API.

## Agent configuration

### Prerequisites

* The Docker-agent must be able to connect to the InfraSonar API (https://api.infrasonar.com) using TCP port 443.
* The Docker-agent must be allowed access to the Unix socket `docker.sock`.
* The Docker-agent requires a valid [token](../../../api/authentication.md).

### Configuration

The Docker-agent is configured using the following mandatory environment variables:

| **variable**          | **description**                                                                                       |
|-----------------------|-------------------------------------------------------------------------------------------------------|
| OSDA_ENVIRONMENT_UUID | The environment UUID.                                                                                 |
| OSDA_TOKEN            | The [authentication token](../../../api/authentication.md) for authenticating to the InfraSonar API. |
| OSDA_HOST_UUID        | The full host UUID.                                                                                   |


#### Figuring out UUID's

1. Navigate to the host you want to add the Docker-agent to.
2. Retrieve the `environment UUID` and `host UUID` from the URL.

```
https://app.infrasonar.com/#/c/110/e/xxxxxxxxxxxx/h/xxxxxxxxxxxx-yyyyyyyyyyyy/overview
                                     ============   =========================
                                            ▲                      ▲
Environment UUID ───────────────────────────┘                      │
Host UUID ─────────────────────────────────────────────────────────┘
```

#### Token

We advise you to create a user for each environment and setup a token for this user.
This ensure the token only has access to the correct environment.

### Docker host configuration

The Docker-agent can be deployed as a Docker container, using the following Docker command:

```bash
docker run \
  --name dockeragent \
  -e OSDA_ENVIRONMENT_UUID="xxxxxxxxxxxx" \
  -e OSDA_TOKEN="my super secret token" \
  -e OSDA_HOST_UUID="xxxxxxxxxxxx-yyyyyyyyyyyy" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  ghcr.io/infrasonar/dockeragent
```

You can also add the Docker-agent to your `docker-compose.yml` file:

```YAML
services
  dockeragent:
    restart: always
    logging:
      options:
        max-size: 5m
    image: ghcr.io/infrasonar/dockeragent
    environment:
      OSDA_ENVIRONMENT_UUID: "xxxxxxxxxxxx"
      OSDA_TOKEN: "my super secret token"
      OSDA_HOST_UUID: "xxxxxxxxxxxx-yyyyyyyyyyyy"
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
```

### InfraSonar configuration

The last step is to add the agent on the host using the InfraSonar UI.
1. Browse to the host
2. Click edit host :material-playlist-edit: button
3. Select the **dockeragent** in the *Probes* section
4. Click save

## Known issues

### Warning message no swap limit support

See [this](https://docs.docker.com/config/containers/resource_constraints/) article to troubleshoot the `WARNING: No swap limit support` message.
