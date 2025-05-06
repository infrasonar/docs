# InfraSonar appliance

InfraSonar probes are deployed and maintained as Docker containers.

We advice to setup a dedicated (virtual) :fontawesome-brands-linux: Linux appliance for your InfraSonar deployment.

## Ubuntu

Our preferred and best supoorted method of deployment is using a dedicated virtual of physical Ubuntu server installation.

We outlined the specific installation steps in our [Ubuntu Installation Guide](./ubuntu_installation.md)

## Oracle Linux

We successfully deployed InfraSonar for one of our customers onto Oracle Linux using [podman](https://podman.io/). Please contact [support](/docs/support/index.md) to learn more about any implementation pitfalls and lessons learned.

## Microsoft Windows

Using [Docker desktop for Windows](https://docs.docker.com/desktop/setup/install/windows-install/) it is possible to deploy InfraSonar on a Windows server or desktop os.

We document this setup [here](./windows_installation.md) but would urge anyone to setup a dedicated Linux appliance as this gives for less overhead then running Docker on Windows which in essence runs on [Windows Subsystem for Linux (WSL)](https://learn.microsoft.com/en-us/windows/wsl/)