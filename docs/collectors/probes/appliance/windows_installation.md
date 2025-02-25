![Software Package](../../../images/windows_logo.png){ width="150" align=right}

# InfraSonar on Windows

As InfraSonar uses Docker containers it can deployed on multiple platforms including Microsoft Windows.

Docker is a great concept to deploy and maintain Linux applications and services even on a Microsoft Windows host.

Checkout the [Get Started with Docker](https://www.docker.com/get-started/) guide to learn more.

!!! info
    We tested this setup on a Windows 11 (24H2) host running Docker Desktop version 4.38.0

## Deploy the InfraSonar containers

Step by step :feet: guide: 

1. Install Docker desktop on your Windows host.
2. Ensure **Start Docker Desktop when you sign in to your computer** is enabled in the docker desktop configuration (:gear:).
3. Download our latest appliance installer for Windows [here](https://github.com/infrasonar/appliance-installer/releases/latest)
4. Extract the zip file.
5. Open a command prompt.
6. Change into the directory were you extracted the appliance installer.
7. Run the `appliance-installer.exe` executable and follow the steps:

```
appliance-installer.exe
Installation Path (enter path or press Enter for default: C:\Users\sysadmin\infrasonar)

Please provide a token for the Agentcore (container token with `CoreConnect` permissions):
<your token appears here>
Please provide a token for the agents (container token with `Read`, `InsertCheckData`, `AssetManagement` and `API` permissions):
<your token appears here>

#############################################################################################

  The appliance for zone 0 will be deployed in the 'C:\Users\sysadmin\infrasonar' directory

#############################################################################################

Do you want to continue? (yes/no)
yes
Please be patient, this may take a while...
Done
```

Open your container on https://app.infrasonar.com and manage the appliance via the [Agentcores](../../../application/agentcores.md) menu