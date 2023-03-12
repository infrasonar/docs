![Software Package](../../images/windows_logo.png){ width="150" align=right}

# InfraSonar on Windows

As InfraSonar uses Docker containers it can be deployed on multiple platforms including Microsoft Windows.

!!! info "Unfortunate Windows Server doesn't support Linux containers"
    Linux containers are available on Windows client (10 and 11) only for development purposes.
    On a physical Microsoft Windows Server machine you can install a Linux VM on Hyper-V and run Docker from there this requires however native hardware or nested virtualization.

For this guide we opt to use a Windows 11 desktop with Docker Desktop.

## Install Docker Desktop on Windows

As the [official Docker documentation](https://docs.docker.com/desktop/install/windows-install/) has a great guide on how to set this up we won't repeat this steps here.

_We tested this setup on a Windows 11 host running Docker Desktop version 4.17.0_

## Deploy the InfraSonar containers

InfraSonar uses Linux docker containers but there is no way need to feel intimidated.

Docker is a great concept to deploy and maintain Linux applications and services even on a Microsoft Windows host.
Checkout the [Get Started with Docker](https://www.docker.com/get-started/) guide to learn more.

### Step by step guide

1. Open notepad :notepad_spiral:
2. Copy the [docker-compose.yml](../collectors/probes/appliance/docker_compose.md) file from our documentation page using the :material-content-copy: button
3. Paste the file into the just opened notepad
4. Ensure to set the correct [tokens](../application/tokens.md) for the agentcore and docker-probe in the `docker-compose.yml` file
5. Save the file as `docker-compose.yml`, in this example we use a folder named `InfraSonar` in de `Documents` folder.<br>
   !!! Be aware notepad has a tendency of adding `.txt` at the end of the filename.
6. Open a dos box `cmd.exe`
7. `cd` to the folder containing the `infrasonar.yml` file<br>
   ```
   cd %userprofile%\documents\infrasonar
   ```
8. Pull the InfraSonar containers using this compose pull:<br>
   ```
   docker compose pull
   ```
   _Downloading all layers might take some time, the total size off all layers is 5Gb_
9. Once the containers are downloaded you can start the environment using:<br>
   ```
   docker compose up -d
   ```

<figure markdown>
  ![InfraSonar on Windows](../images/guides_windows_appliance_1.png){ width="800" }
  <figcaption>InfraSonar on Windows</figcaption>
</figure>


## Fix Vmmem memory consumption

Vmmem uses a lot of  RAM when running Docker on WSL, luckily there is an easy fix.

**Shut down WSL**

Run this on your command line:
```
wsl --shutdown
```

**Edit your .wslconfig file**

As the .wslconfig file is a hidden file it is best to open it directly using notepad:
```
notepad %UserProfile%/.wslconfig
```

If it doesn’t exist yet, just create it.

Edit your `.wslconfig` file to limit memory usage
You should have something like this in the file:

```
[wsl2]
memory=2GB
```