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

## Additional information

:material-github: [Microsoft Hyper-V probe source code](https://github.com/infrasonar/hyperv-probe)









