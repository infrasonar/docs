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

todo tokens

## Deploy the InfraSonar appliance

We suggest using our [Ubuntu appliance installation](../collectors/probes/appliance/ubuntu_installation.md) to setup your appliance.

If you don't feel comfortable deploying a Linux VM or prefer to setup a dedicated monitoring hardware appliance please contact [support](../introduction/support.md). 

## Configure probes

If the appliance deployment went okay you should see an [agentcore](../application/agentcores.md) in your container.

1. First step is to navigate to the [collectors](../application/collectors.md) page in your container.
2. Enable the [probes](../collectors/probes/index.md) you want to use by toggling them **on**.
3. Go to the [agentcore](../application/agentcores.md) menu and click the :gear: gear icon.
4. Select the **Probes** tab and click **Sync with container**.
5. Select the :material-pencil: pencil for each of of the probes and enter any required credentials, see our individual [probe documentation](../collectors/probes/index.md) for additional information.
6. Click **apply changes** and wait :hourglass_flowing_sand: for the probes to get deployed to the appliance.

## Add assets.

## Configure conditions.

## Bonus step: add external notifications







Implementing a basic InfraSonar configuration is easy because InfraSonar can be deployed agent-less and thus leaves no footprint on the monitored infrastructure.

The first step is to deploy an InfraSonar appliance

1. **Deploy the InfraSonar appliance**<br>
   Deploy an [InfraSonar appliance](../collectors/probes/appliance/index.md) in your infrastructure.
2. **Add assets**<br>
   Use our webapp to [add assets](../application/assets.md) and collectors per asset to your container.
3. **Add labels**<br>
   [Label](../application/labels.md) your assets to apply our pre-defined conditions.

!!! note "Probe configuration and credentials"

    Some probes require you to configure credentials, see our [probe](../collectors/probes/index.md) and our [Remote Appliance Manager](../application/agentcores.md) documentation for more information.




Our agent-less implementation is a non-intrusive and thus a great way to get to know InfraSonar.


## Implementation support

Feel free to [reach out to us](support.md) for support when implementing/evaluating InfraSonar.

Our implementation Consultants have years of experience and are keen to show you around and get the best out of our platform.


## Howto's







=== "Agents"

    * Sed sagittis eleifend rutrum
    * Donec vitae suscipit est
    * Nulla tempor lobortis orci

=== "Probes"

    Probes collect data agentless, data is collected using monitoring protocols or API’s supplied by the vendor.

    An example of a probe is our WMI probe to monitor Microsoft Windows assets.

    Probes are typically deployed on a Linux appliance using Docker. Probe are orchestrated by our [agentcore](../collectors/probes/agentcore.md), the agentcore is also responsible for sending the data to our cloud platform. See our [probes documentation](../collectors/probes/index.md) for additional probe related documentation and an overview currently supported probes.


=== "Services"

    * Sed sagittis eleifend rutrum
    * Donec vitae suscipit est
    * Nulla tempor lobortis orci