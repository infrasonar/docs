# :fontawesome-solid-magnifying-glass: Agent-core

The Agent-core orchestrates our [probes](index.md) and is responsible for scheduling checks. During the startup sequence of a probe, it will “announce” itself to the Agent-core.

The Agent-core also acts as a communication gateway. Data retrieved by the probes is sent to the InfraSonar cloud platform via the Agent-core.

## Communication

``` mermaid
graph LR
  probe[Probe] --> | TCP 7211 | Agentcore[Agent-core] --> | HTTPS 443 | infrasonarcloud[InfraSonar Cloud Platform];
```

Because probes usually run in the same Docker network as the Agent-core, they can easily connect to it.

## Operational

### Removing an Agent-core.

When an Agent-core is decommissioned, all hosts monitored by it need to be moved to another Agent-core.

The UI does not allow an Agent-core to be removed if there are still hosts attached to it.