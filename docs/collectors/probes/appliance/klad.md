### Accessing your appliance

InfraSonar runs in Docker containers on Linux. Access is possible through the console in your virtualization solution. But a more straightforward approach is to use [SSH](https://linuxhandbook.com/ssh-basics/).

Modern desktop operating systems have the *ssh* command as part of their terminal. Alternatively, you can download and use [PuTTY](https://www.putty.org/).

SSH access is granted to the `sysadmin` user.





### Nano basics

The InfraSonar appliance configuration requires you to edit files using SSH access. The appliance includes the main text editors of **vi** and **nano**.

Since Nano is easier to use, we outline its essential functions here.

In this example, we create will add credials for the [WMI-probe](../probes/wmi/). See the [credentials section](credentials.md) for more in-depth information regarding credential files.

The easiest way to use Nano, is to open the file you want to edit or create directly using Nano, like this:

```bash
nano /etc/infrasonar/data/config/infrasonar.yaml
```

!!! note SSH access assumed
    We assume you are logged on to the appliance using SSH.

This command will launch the Nano editor, where you can immediately make changes to the file:

<figure markdown>
  ![NanoScreenshot](../../../images/nano_screenshot.png)
  <figcaption>Nano screenshot</figcaption>
</figure>

When your edits are done, exit using ++ctrl+x++. Nano now prompts if you want to **Save modified buffers**.

If you want to save your edits press ++y++, followed by an ++enter++ to confirm the filename.

Press ++n++ if you want to discard your edits or ++ctrl+c++ if you want to continue editing.


### Network mode advanced

```
## InfraSonar docker-compose.yml file
##
## Set the correct TOKEN variables before starting.

x-infrasonar-template: &infrasonar
  #network_mode: host
  networks:
    - infrasonar_dev
  restart: always
  logging:
    options:
      max-size: 5m
  volumes:
      - ./data:/data/
  labels:
    com.centurylinklabs.watchtower.scope: ${AGENTCORE_TOKEN}

networks:
  infrasonar_dev:

services:
  agentcore:
```


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


## Operational notes

TODO

```bash
docker compose -f /etc/infrasonar/docker-compose.yml pull
docker compose -f /etc/infrasonar/docker-compose.yml up -d
```

[Contact InfraSonar support](../../../introduction/support.md)    if you require any assistance.

## Monitor the appliance

Since InfraSonar is a monitoring platform, the first thing to do is monitor the appliance using the SNMP-probe.




------

## Explain when to use multiple containers

One aspect to think about beforehand is if you are going to use one ore multiple containers for your assets.
Multiple containers is a typical approach for managed service providers, if you feel you need multiple containers it is advisable to [create a container](../application/child_containers.md#setup-a-new-container) for your first steps into InfraSonar as this makes it easier to move forward when wanting to add other environment into containers.