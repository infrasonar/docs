![Zones](../images/application_zones.png){ width="200" align=right}

# zones

Zones can be useful when assets are located in a dmz or remote networks as it allows to direct assets to a specific Agentcore by configuring the asset to be a member of the specific zone.

## Good to know

* When one or more [Agentcores](agentcores.md) are configured in the specified zone an asset is bound to one of the Agentcores in this zone.
* If no agentcores are configured in the specified zone we fall back to any other agent core.
* For assets being monitored using an agent the zone configuration is purely cosmetic.

*In the future we might add a link between zones and locations.*