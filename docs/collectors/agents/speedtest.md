![Speed](../../images/agent_speedtest.png){ width="150" align=right}

# :simple-speedtest: Speedtest

The speedtest-agent measures upload and download speeds using Ookla's [speedtest](https://single.speedtest.net/) service.

!!! note "Third party data collection"
    Ookla collects certain data through Speedtest that may be considered personally identifiable, such as your IP address, unique device identifiers or location. Ookla believes it has a legitimate interest to share this data with internet providers, hardware manufacturers and industry regulators to help them understand and create a better and faster internet. For further information including how the data may be shared, where the data may be transferred and Ookla’s contact details, please see Ookla's [Privacy Policy.](https://single.speedtest.net/about/privacy)

## Features

* **Speedtest** Monitors upload and download speeds as observed from the agent's perspective

## Deployment

The speedtest agent is easiest deployed on your monitoring [appliance](../probes/appliance/index.md) using our [Remote Appliance Deployment](../../application/agentcores.md).

### Docker

If desired you can deploy the speedtest agent standalone in a docker container for example:

```bash
docker run \
  --name speedtestagent \
  -e TOKEN="<<agent token>>" \
  -e ASSET_ID="<<asset_ID>>" \
  -d \
  ghcr.io/infrasonar/speedtest-agent
```

Ensure you add the agent onto the asset prior to deploying the agent.

## Additional information

:material-github: [Speedtest agent source code](https://github.com/infrasonar/speedtest-agent)
