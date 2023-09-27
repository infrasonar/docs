![wmi-probe](../../../images/probe_wmi.png){ width="150" align=right}

# Hyper-V guest

## Introduction

InfraSonar can use the [WMI](https://en.wikipedia.org/wiki/Windows_Management_Instrumentation) protocol to monitor Microsoft Windows Hyper-V guests without installing an agent on them. Monitoring in this scenario is performed by periodically querying the Windows host using WQL queries.

InfraSonar uses the open source [aiowmi](https://github.com/cesbit/aiowmi) library released in 2021 by Cesbit.

!!! note
    The Microsoft Hyper-V guest probes requires the [Hyper-V](hyperv.md) probe to be installed first as these act as a "proxy" for the guest queries.

## Features

* Guest status as provided by the `Msvm_ComputerSystem` class

## Deployment

The HyperV- guest probe is deployed as a :material-docker: docker container using [docker compose](../appliance/docker_compose.md).

## Probe configuration

![screenshot hypervguest config](../../../images/application_hypervquest_config.png)

**:material-numeric-1-circle:{ .red } Hypervisor**

:   Address of the hypervisor you want to query, usually you would use the IP or FQDN of the Hyper-V host. 

**:material-numeric-2-circle:{ .red } GUID**

:   You can lookup the **GUUID** on the details page of the asset you want specified as Hyper-V host :material-numeric-1-circle:{ .red }

**:material-numeric-3-circle:{ .red } Local conguration**

:   As the Hyper-V guest connects to the Hyper-V host we urge you to use the same credentials for the Hyper-V guest queries. When Hyper-V is deployed in a windows domain you can set local configuration to `wmi` as this section is the default section for domain credentials.

    See also our [credentials documentation](../appliance/credentials.md).

You can automate this step using our toolkit and the Hyper-V guests report.

Please reach out to [support](../../../introduction/support.md) for additional information.

## Additional information

:material-github: [Microsoft Hyper-V guest probe source code](https://github.com/infrasonar/hypervguest-probe)









