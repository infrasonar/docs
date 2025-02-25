# Agentless implementation

Our agentless implementation leans on our probes and services collector concepts.

In this guide we show you how to deploy your own basic agentless implementation.

Deployment steps

1. Prepare the container you want to use for your agentless deployment
2. Deploy the InfraSonar appliance
3. Configure the probes
4. Add assets
5. Review our conditions

## Prepare your container

Setup [tokens](../application/tokens.md) for the agentcore and agents.

## Deploy the InfraSonar appliance

We suggest using our [Ubuntu appliance installation](../collectors/probes/appliance/ubuntu_installation.md) to setup your appliance.

If you don't feel comfortable deploying a Linux VM or prefer to setup a dedicated monitoring hardware appliance please contact [support](../support/index.md).


If the appliance deployment went okay you should see an [agentcore](../application/agentcores.md) in your container.

## Deploy collectors

First step is to deploy collectors, this can easily be done using our [Remote Appliance Manager](../application/agentcores.md#remote-appliance-manager).

1. Navigate to the [collectors](../application/collectors.md) page in your container.
2. Enable tne `wmi`, `eventlog`,`snmp` and `lastseen` collectors by toggling them **on**.
3. Go to the [agentcore](../application/agentcores.md) menu and click the :gear: gear icon.
4. Select the **Probes** tab and click **Sync with container**.
5. Select the :material-pencil: pencil next to the wmi probe and enter domain admin credentials, see our [WMI probe](../collectors/probes/wmi/index.md) for more information.
6. Select the :material-pencil: pencil next to the eventlog probe and toggle **Use reference configuration** on, ensure **wmi** is selected as reference configuration.
7. Click **apply changes** and wait :hourglass_flowing_sand: for the probes to get deployed to the appliance.



## Add assets

We outline how to setup monitoring for a Microsoft Windows asset and a common networking switch.

### Microsoft Windows

Add your Windows assets,

1. Navigate to the [Assets](../application/assets.md) page in your container.
2. Click the **Add asset** button.
3. Enter a **name** for your asset, we suggest using the actual name and even better de FQDN of your asset.
4. Enter an optional **description**.
5. Leave **Mode** set to **Normal**, see our [Modes](../application/modes.md) documentation for more information.
6. Leave Zone to **default :: 0**, see our [Zones](../application/agentcores.md#zones) documentation section for more information.
7. Add the following **Collectors**: `wmi` and `eventlog`
8. Add the `Windows` label in the **Labels** menu
9. Open the **eventlog** tab and provide the server address. (_if the previously entered name can be resolved by the appliance you can leave the address empty._)
10. Open the **wmi** tab and provide the server address.

Note several [notifications](../concept/alerts-notifications.md#notifications) appearing as we did't not receive any data yet, these notifications should disappear within the monitoring interval once data is retrieved.


### Generic networking switch

Adding a generic network switch is easy, it requires however a managed switch that support SNMP.

1. Configure your switch to accept SNMP queries from your appliance IP address and configure a SNMP community string, see also our [SNMP Prerequisites](../collectors/probes/snmp/index.md#prerequisites) documentation.
2. Click the **Add asset** button.
3. Enter a **name** for your asset, we suggest using the actual name and even better de FQDN of your asset.
4. Enter an optional **description**.
5. Leave **Mode** set to **Normal**, see our [Modes](../application/modes.md) documentation for more information.
6. Leave Zone to **default :: 0**, see our [Zones](../application/agentcores.md#zones) documentation section for more information.
7. Add the following **Collector**: `snmp`<br>_Note for a number of network switch vendors we have optional collectors, see our [snmp collector](../collectors/probes/snmp/index.md) section._
8. Add the `Network Switch` label in the **Labels** menu
9. Open the **snmo** tab and provide the switch IP address. (_if the previously entered name can be resolved by the appliance you can leave the address empty._)


## Last seen

When you observe your asset list you will note a :black_circle: grey dot in the **active** column.

This indicates we don't monitor when data for this asset arrived. We can easily fix this by adding our `lastseen` collector.

1. Open the [asset](../application/assets.md) and click the :material-pencil: pencil icon.
2. Add the `lastseen` collector and click **save**
3. Observe the :black_circle: grey dot turning into a :green_circle: green dot, hopefully :smiley:...<br>
_if the dot turn into a :red_circle: dot this implies we have not seen data for this asset for some time, see also our [lastseen](../collectors/services/last_seen.md) collector documentation for additional information._

## Conditions

Let's find out which [conditions](../concept/conditions.md) are used to monitor your assets.

1. Open the [asset](../application/assets.md) and click the :material-pencil: pencil icon.
2. Open the **Effective** tab and note which conditions are now active.

## Conclusion

We hope this gave you some insight howto get started with InfraSonar.<br>
If you encounter any problems please [contact](../support/index.md) us, we are always eager to learn how we can improve or advise you on next steps.