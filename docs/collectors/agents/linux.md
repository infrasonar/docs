![Microsoft Windows](../../images/windows_logo.png){ width="150" align=right}

# :fontawesome-brands-linux: Linux agent

Our Linux agent is a single binary which can easily be deployed on **x86** Linux systems.
_If you need to monitor a different CPU architecture please contact support._

## Installation

### Easy deployment

You can use our easy deployment script to swiftly deploy the InfraSonar agent onto your Linux systems.

Prerequisites:
- **curl**, this script is downloaded using the `curl` command and also uses this command internally to download our binary agent.
- **elevated privileges** as it installs a service.
- **systemd**, our easy deployment scrips opt to use `systemd` to install the agent as as service.


```batch
sudo /bin/bash -c "$(curl -fsSL https://deploylinuxagent.infrasonar.com)"
```

The install script prompts you for the **InfraSonar agent token** and optional asset token as shown below:

```
[INFO] Creating directory '/opt/infrasonar-agent'...
[INFO] Configuration file does not exist.
[INFO] Creating directory '/etc/infrasonar'...
Please enter your token: <<ENTER YOUR INFRASONAR AGENT TOKEN HERE>>
Add asset token, leave empty for auto creation: 
[INFO] Created config file '/etc/infrasonar/linux-agent.env'...
[INFO] Successfully downloaded infrasonar-linux-agent
[INFO] Creating systemd unit file '/etc/systemd/system/infrasonar-agent.service'...
[INFO] Enabling and starting the InfraSonar agent service...
Created symlink /etc/systemd/system/multi-user.target.wants/infrasonar-agent.service → /etc/systemd/system/infrasonar-agent.service.
[INFO] Infrasonar agent service started successfully.
[INFO] InfraSonar Linux Agent deployment complete.
```

By default this script installs the binary in `/opt/infrasonar-agent` and it's config file in `/etc/infrasonar` the service is installed as  `infrasonar-agent`

??? note "Linux deployment script source code"
    The source code of our easy deployment script:

    ```bash title="Deplyment script source code"
    --8<-- "collectors/agents/linux.bash"
    ```


### Verify

You can verify if the agent is running correctly using the following command:

```bash
systemctl status infrasonar-agent
```

It should output something similar as this:

```
● infrasonar-agent.service - InfraSonar Linux Agent
     Loaded: loaded (/etc/systemd/system/infrasonar-agent.service; enabled; preset: enabled)
     Active: active (running) since Fri 2025-06-27 08:02:17 UTC; 7min ago
   Main PID: 587 (infrasonar-linu)
      Tasks: 7 (limit: 38298)
     Memory: 5.2M (peak: 7.9M)
        CPU: 40ms
     CGroup: /system.slice/infrasonar-agent.service
             └─587 /opt/infrasonar-agent/infrasonar-linux-agent

Jun 27 08:02:17 linuxagent-ubuntu systemd[1]: Started infrasonar-agent.service - InfraSonar Linux Agent.
Jun 27 08:02:17 linuxagent-ubuntu infrasonar-linux-agent[587]: 2025/06/27 08:02:17 Starting InfraSonar Linux Agent Collector v0.1.1
Jun 27 08:02:18 linuxagent-ubuntu infrasonar-linux-agent[587]: 2025/06/27 08:02:18 Created asset `linuxagent-ubuntu.fritz.box` (Id: 97898)
Jun 27 08:02:18 linuxagent-ubuntu infrasonar-linux-agent[587]: 2025/06/27 08:02:18 Scheduled: CHECK_NETWORK_INTERVAL: 300 / Inital wait: 97
Jun 27 08:02:18 linuxagent-ubuntu infrasonar-linux-agent[587]: 2025/06/27 08:02:18 Scheduled: CHECK_SYSTEM_INTERVAL: 300 / Inital wait: 113
Jun 27 08:02:18 linuxagent-ubuntu infrasonar-linux-agent[587]: 2025/06/27 08:02:18 Scheduled: CHECK_DISK_INTERVAL: 300 / Inital wait: 116
Jun 27 08:02:18 linuxagent-ubuntu infrasonar-linux-agent[587]: 2025/06/27 08:02:18 Scheduled: CHECK_MEMINFO_INTERVAL: 300 / Inital wait: 74
```

## Additional information

:material-github: [Linux agent source code](https://github.com/infrasonar/linux-agent)