![Terminology](../images/application_terminology.png){ width="400" align=right}

# Terminology

Terminology in IT is always a bit of a challenge :fontawesome-regular-face-laugh-wink:
 we try to make it easier by outlining what we mean with curtain terms.

## Terminology overview

Term           | Description
---------------|----------------------------------------------------------
**Agentcore**  | Central component in a monitored infrastructure that acts as a relay between probes and the InfraSonar cloud.
**Agents**     | A standalone InfraSonar component that can send monitoring data to InfraSonar via the [API](../../api/overview)
**API**        | The [API](../../api/overview) allows users to perform automated access using a personal access token.
**Appliance**  | A dedicated (virtual) Linux appliance for InfraSonar.
**Asset**      | A monitored network component in an environment.
**Container**  | Used to organize environments and authorization in those environments.
**Frontend**   | These are the webservers hosting the UI for end users to access InfraSonar.
**Hub**        | State is stored here in memory, and logic is performed when new monitoring data arrives.
**SiriDB**     | The [database](https://siridb.com) used for storing [timeseries data](https://en.wikipedia.org/wiki/Time_series) with a long term retention.
**Probes**     | These perform the actual measurement and are tailored per monitored component.