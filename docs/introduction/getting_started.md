![Start here](../images/introduction_starthere.png){ width="150" align=right}

# Getting started with InfraSonar

## Familiarize

We recommend setting up a small-scale testing environment and using this documentation to guide you on your journey to become acquainted with InfraSonar and its terminology.

## Implementation steps

We outline the implementation steps for an agent-less implementation as this is a non-intrusive way to get to know InfraSonar.

### Agent-less implementation

Implementing a basic InfraSonar configuration is easy because InfraSonar can be deployed agent-less and thus leaves no footprint on the monitored infrastructure.

The first step is to deploy an InfraSonar appliance

1. **Deploy the InfraSonar appliance**<br>
   Deploy an [InfraSonar appliance](../collectors/probes/appliance/index.md) in your infrastructure.
2. **Add assets**<br>
   Use our webapp to [add assets](../application/assets.md) and collectors per asset to your container.
3. **Add labels**<br>
   [Label](../application/labels.md) your assets to apply our pre-defined conditions.

!!! note "Probe configuration and credentials"

    Some probes require you to configure credentials, see our [probe](../collectors/probes/index.md) and [credentials](../collectors/probes/appliance/credentials.md) specific documentation for more information.

## Implementation support

Feel free to [reach out to us](support.md) for support when implementing/evaluating InfraSonar.

Our implementation Consultants have years of experience and are keen to show you around and get the best out of our platform.
