![wmi-probe](../../../images/probe_wmi.png){ width="150" align=right}

# HyperV

## Introduction

InfraSonar can use the [WMI](https://en.wikipedia.org/wiki/Windows_Management_Instrumentation) protocol to monitor Microsoft Windows Hyper-V hosts without installing an agent on them. Monitoring in this scenario is performed by periodically querying the Windows host using WQL queries.

InfraSonar uses the open source [aiowmi](https://github.com/cesbit/aiowmi) library released in 2021 by Cesbit.

## Features

* Hyper-V quest overview

## Deployment

The HyperV probe is deployed as a :material-docker: docker container using [docker compose](../appliance/docker_compose.md).

## Probe configuration

Deployment of the Hyper-V probe is the simulair to deploying the [WMI](index.md) probe as it is in essence an extension of the WMI probe.

![screenshot hypervguest config](../../../images/application_hyperv_config.png)

**:material-numeric-1-circle:{ .red } Address**

:   Address of the Hyper-V host you want to query, in most cases this is the same address as used for the WMI probe. 

**:material-numeric-2-circle:{ .red }Local conguration**

:   In most scenarios setting this to `wmi` is fine as this is the default section for WMI credentials. See our [credentials documentation](../appliance/credentials.md) for more advanced implementation scenarios.

## Additional information

:material-github: [Microsoft Hyper-V guest probe source code](https://github.com/infrasonar/hypervguest-probe)


## Additional information

:material-github: [Microsoft Hyper-V probe source code](https://github.com/infrasonar/hyperv-probe)









