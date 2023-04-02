# :material-docker: Docker deployment

InfraSonar probes and the InfraSonar Agentcore are distributed using Docker containers via [docker compose](https://docs.docker.com/compose/).

## Docker compose file

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

