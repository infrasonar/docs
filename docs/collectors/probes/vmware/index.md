![VMware](../../../images/probe_vmware.png){ width="150" align=right}

# VMware

## Introduction

InfraSonar has two probe to monitor VMware hypervisors:

* [ESXi](esx.md)
* [vCenter](vcenter.md)

Both probes use the [VMware API](https://www.vmware.com/support/pubs/sdk_pubs.html) to collect data.

We advise to always install bot the vCenter and the ESXi probes.
For standalone ESXi host we created a specific label ensuring optimal monitoring for this scenario.

## Features
Two notable metrics we added to our guest monitoring:

*Our default label for standalone ESXi hosts contains specific conditions for these metrics*

### disk bus reset

If a storage device is overwhelmed with too many read and write commands from an ESXi host, or if it encounters a hardware issue and fails to abort commands, it will clear out all commands waiting in its queue. This is called a disk bus reset. Disk bus resets are a sign of a disk storage bottleneck and can cause slower VM performance, as VMs will need to resend those requests. Disk bus resets typically do not occur in healthy vSphere environments, so you should investigate any VM with a positive value for the disk.bus.reset metric

### CPU readiness

The CPU readiness metric tracks the percentage of time a virtual machine is ready to run a workload but has to wait on the ESXi host to schedule it due to there not being enough physical CPU available. Monitoring CPU readiness time can give you a good idea of whether or not your VMs are running efficiently or spending too much time waiting and unable to run their workloads.
While some CPU readiness time can be normal, VMware recommends setting an alert to let you know if this metric surpasses 5 percent. VMs that spend a significant percentage of their time in a ready state will be unable to execute tasks, which can lead to poor application performance and possibly timeout errors and downtime.