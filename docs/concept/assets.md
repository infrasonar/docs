![Assets](../images/concept_assets.png){ width="150" align=right}

# :material-laptop: Assets

Assets are in essence the monitored objects in an InfraSonar implementation.

Assets can be IT components such as routers, switches, servers etc but can easily also consists of any other device which can be monitored such as elevators, IOT devices, etc.
As a rule of thumb, if we can retrieve data and send it back to our cloud-platform we should be able to monitor it.

## Collectors

[Collectors](./collectors.md) and labels form a symbiotic relation are added to assets and 

## Labels

## Guest to asset

Some collectors allow assets to be easily added from a "guest list" retrieved by the collector.

Collectors that support this feature include:

* [Discovery agent](../collectors/agents/discovery.md)
* [Microsoft hyperV](../collectors//probes/wmi/hyperv.md)
* [Unifi collector](../collectors/probes/unifi.md#unifi-controller)
* [VMware ESXi](../collectors/probes/vmware/esx.md)
* [VMware vCenter](../collectors/probes/vmware/vcenter.md)

