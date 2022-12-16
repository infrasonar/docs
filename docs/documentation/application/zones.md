# zones

When one or more agentcores are configured in the specified zone an asset is bound to an agentcore in this zone.
If no agentcores are configured in the specified zone we fall back to any other agent core.

This feature can be useful for assets in a dmz or remote networks as it allows to direct probes to a specific zone.

For assets being monitored using an agent the zone configuration is purely cosmetic.

*In the future we might add a link between zones and locations.*