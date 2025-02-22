# Agentless implementation

Our agentless implementation leans on our probes and services collector concepts.

In this guide we show you how to deploy your own agentless implementation .

Deployment steps

1. Prepare the container you want to use for your agentless deployment
2. Deploy the InfraSonar appliance
3. Configure the probes
4. Add assets
5. Configure conditions
6. Bonus step: add external notifications

## Prepare your container

Setup [tokens](../application/tokens.md) for the agentcore and agents.

## Deploy the InfraSonar appliance

We suggest using our [Ubuntu appliance installation](../collectors/probes/appliance/ubuntu_installation.md) to setup your appliance.

If you don't feel comfortable deploying a Linux VM or prefer to setup a dedicated monitoring hardware appliance please contact [support](../support/index.md).


If the appliance deployment went okay you should see an [agentcore](../application/agentcores.md) in your container.

## Add assets

We outline how to setup monitoring for a Microsoft Windows asset, a Linux asset and a common networking switch.

### Microsoft Windows

First step is to deploy the WMI and Eventlog collectors, this can easily be done using our Remote Appliance Manager.

1. Navigate to the [collectors](../application/collectors.md) page in your container.
2. Enable tne **wmi** and **eventlog** collector by toggling them **on**.
3. Go to the [agentcore](../application/agentcores.md) menu and click the :gear: gear icon.
4. Select the **Probes** tab and click **Sync with container**.
5. Select the :material-pencil: pencil next to the wmi probe and enter domain admin credentials, see our [WMI probe](../collectors/probes/wmi/index.md) for more information.
6. Select the :material-pencil: pencil next to the eventlog probe and toggle **Use reference configuration** on, ensure **wmi** is selected as reference configuration.
7. Click **apply changes** and wait :hourglass_flowing_sand: for the probes to get deployed to the appliance.


Add your Windows assets,

1. Navigate to the [Assets](../application/assets.md) page in your container.
2. Click the **Add asset** button.
3. Enter a **name** for your asset, we suggest using the actual name and even better de FQDN of your asset.
4. Enter an optional **description**.
5. Leave **Mode** set to **Normal**, see our [Modes](../application/modes.md) documentation for more information.
6. Leave Sone to **default :: 0**, see our [Zones](../application/agentcores.md#zones) documentation section for more information.
7. Add the following **Collectors**: _wmi_ and _eventlog_
8. Add the `Windows` label in the **Labels** menu
9. Open the **eventlog** tab and provide the server address. (_if the previously entered name can be resolved by the appliance you can leave the address empty._)
10. Open the **wmi** tab and provide the server address.


### Generic networking switch

