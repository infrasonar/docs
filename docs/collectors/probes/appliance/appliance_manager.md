# Appliance manager

We created a convenient tool named [appliance manager](https://github.com/infrasonar/appliance-manager) to manage your InfraSonar implantation on Debian derived Linux distributions.

## Installation

```bash
sudo apt install -y -q python3 curl pip
sudo curl -sSL https://get.docker.com | bash
sudo pip install infrasonar-appliance
```
## Usage

You can start the tool using the command: `sudo appliance`

This starts an easy to navigate interface which allows you to set credentials and download probes you [enabled in our UI](../../../application/collectors.md).

On first start you are asked for a directory to use, we suggest to use our default `/etc/infrasonar` as the main directory.

```
┌───────────────────────────────────────────────────────────────────────────────┐
│    ___       __          ___                                                  │
│   |_ _|_ _  / _|_ _ __ _/ __| ___ _ _  __ _ _ _                               │
│    | || ' \|  _| '_/ _` \__ \/ _ \ ' \/ _` | '_|                              │
│   |___|_||_|_| |_| \__,_|___/\___/_||_\__,_|_|                                │
│                                                                               │
│   Manage probes                                                               │
│   Manage agents                                                               │
│                                                                               │
│   Change agentcore token                                                      │
│   Change agent token                                                          │
│   Change zone                                                                 │
│                                                                               │
│   Exit                                                                        │
│                                                                               │
│                                                                               │
│                                                                               │
│                                                    InfraSonar status: running │
└───────────────────────────────────────────────────────────────────────────────┘
```

### Manage probes

Here you can easily manage the credentials for all probes currently running on this appliance.
Just select the probe you want to manage.

When you selected a probe you can view it's logging and change to our unstable channel, we urge you to only do so when instructed by our support staff.

For probes which require credentials you can easily configure them here.

#### Synchronize

Use the synchronize option to sync the probes configured to run in the [UI](../../../application/collectors.md). with the appliance.



### Manage agents

Here you can manage any agent that can be deployed on your appliance, note we deploy the [docker agent](../../agents/docker.md) by default.

### Change agentcore token

Here you can change the [agentcore token](../../../application/tokens.md) if needed.

### Change agent token

Here you can change the [agent token](../../../application/tokens.md) if needed.

### Change zone

Here you can configure the [zone ID](../../../application/zones.md) if needed.



We suggest to use `/etc/infrasonar` as the main directory.

On the downloadable appliance we provide the `docker-compose.yml` file at the following location `/etc/infrasonar/docker-compose.yml.example`.
