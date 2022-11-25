# Assets

## Add asset

When you are in the assets view you can add a new asset using the Add asset button.

<figure markdown>
  ![InfraSonar add host](../../images/application_add_asset.png){ width="800" }
  <figcaption>InfraSonar add host</figcaption>
</figure>

## Basic asset configuration

<figure markdown>
  ![InfraSonar add asset details](../../images/application_add_asset_details.png){ width="800" }
  <figcaption>InfraSonar add asset details</figcaption>
</figure>

Configuring an asset involves the following steps:

1. Enter an asset name.<br>
   *We strongly suggest entering the correct hostname here, but do not enforce this.*
2. Enter an optional description.
3. Select the mode.<br>
   *This is usually normal.*
4. Select the zone.
5. Select the [collectors](../collectors/probes/index.md) you want to use.
6. Enter the correct labels for this asset.

## Advanced asset configuration

### mode

We identify the following modes for an asset or a container:

mode                    | description
------------------------|-----------------------------
normal                  | normal operations, all conditions are evaluated.
maintenance (no alerts) | All asset notifications and alert messages suppressed
disabled (no checks)    | All data send by an agent for this asset is ignored. <br>Any probes / checks configured for this asset are stopped.


These modes can be set on a container using the container model. 

### zone

When one or more agentcores are configured in the specified zone the host is bound to an agentcore in this zone.
If no agentcores are configured in the specified zone we fall back to any other agent core.

This feature can be useful for assets in a dmz or remote networks as it allows to direct probes to a specific zone.

For agents the zone is only cosmetic.

*In the future we might add a link between zones and locations.*

### Collectors

Here you can add or remove a collector on an asset.

When a collector is added additional tabs are added to the asset editor allowing you to configure the collector.

See the [collectors section](../collectors/index.md) in our documentation for additional information.

When you remove an agent based collector here the agent can no longer send data to this asset and will receive a 409 error from our api.


### Labels

Here you can add or remove labels on an asset.

See the [labels section](labels.md) in our documentation for additional information.


## Adding multiple assets

When there is a need to add multiple assets at once we suggest using our [api](api/../index.md).