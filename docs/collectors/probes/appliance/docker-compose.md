# InfraSonar docker-compose file

Our docker-compose file to be used when deploying InfraSonar completely manually.

## Docker compose sections

Some noteworthily sections of our `docker-compose.yml` file:

*Services*
:   We advise to only include collectors which are actually used.

*Volumes*

:   We opt to store the InfraSonar related data and configuration in the same sub-directory `data` in the directory where the docker compose file lives.

*Networking*

:   We use the host network for all our containers and thus probes to avoid any networking issues.

*x-infrasonar-template section*

:   The `x-infrasonar-template` section ensures the default settings are the same for all InfraSonar containers.

*Watchtower service*

:   We use [Watchtower](https://containrrr.dev/watchtower/) to periodicity check for updates.

    Within the Watchtower service we mount the localtime file to ensure the container is running in the same timezone as the appliance.

*rapp service*

:   [Remote appliance Manager](https://github.com/infrasonar/rapp) allows you to [manage](../../../application/agentcores.md#remote-appliance-manager) your InfraSonar docker containers and config from our webapp.

    Note that rapp takes control of this `docker-compose.yaml` file and uses it's own templating style to manage the file programmatically. 

## Docker compose file

```yaml title="docker-compose.yaml"
--8<-- "collectors/probes/appliance/docker-compose.yaml"
```