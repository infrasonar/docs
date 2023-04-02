# Deploy infraSonar

InfraSonar probes can easily be deployed and maintained using our easy deployment script

## Prerequisites

1. Before deploying InfraSonar ensure you have an AgentCore and an agent token.<br>See our [token documentation](../../../application/tokens.md) on how to create tokens.
2. Access to a Linux host running docker compose V2;

## Easy deployment

Our installer script deploys InfraSonar into the directory where you executed this script. We suggest you create a new directory for our configration, for example `/etc/infrasonar`


```bash
/bin/bash -c "$(curl -fsSL https://deploy.infrasonar.com)"
```

When the Docker environment is up and running, you should see the Agentcore appear in the UI in the [Agentcores section](../../../application/agentcores.md)

You will also note several files in your directory which we outline in the next paragraph.

## Directory breakdown

file / directory             | Remark
-----------------------------|------------------------------
.env                         | This file contains the InfraSonar tokens and is used by the `docker-compose.yml` file
[docker-compose.yml](./docker_compose.md)           | Contains alle InfraSonar probes as services next to the [agentcore](../agentcore.md) and watchtover service
/data                        | data volume, mounted to all InfraSonar services to store their config
/data/.agentcore.json        | Agentcore configuration 
/data/.asset.json            | Docker agent configuration
/data/config                 | Contains probe specific configuration files
[/data/config/infrasonar.yaml](./credentials.md) | Contains probe specific configuration such as credentials.

## Rerun

If you want to retrieve our latest `docker-compose.yml` file you can do so by renaming your existing `docker-compose.yml` file as backup and rerunning our deployment script.

```bash
mv docker-compose.yml docker-compose.yml.bak
/bin/bash -c "$(curl -fsSL https://deploy.infrasonar.com)"
```