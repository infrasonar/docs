# Discovery



The Discover agent uses [nmap](https://nmap.org/) to periodically scan and map a subnet for assets and open TCP ports.

Assets discovered by the discovery agent can easily be added to InfraSonar.

## Features

* **Subnet scan**, scan a subnet for assets and open TCP ports.
* **Add assets**, easily add dicovered assets to InfraSonar directly from the detailed scan output.
* **Periodically  or one off**, our discovert agent can be deployed to run periodically or once as a means for initial deployment. 


## Prerequisites

The discovert agent uses [Nmap](https://nmap.org/) under the hood and expects Nmap to be installed on the system were the agent is being deployed.

_Our docker-container deployment already includes Nmap_ 

See the [Nmap download page](https://nmap.org/download.html) for more information how to install Nmap.

!!! tip "Nmap on Windows"
    On modern Windows installation Nmap can easilty be installed via `winget`
    ```
    winget install -e --id Insecure.Nmap
    ```


## Installation

### InfraSonar appliance

You can easily deploy our discovery agent using our [Remote Appliance Manager](../../application/agentcores.md#remote-appliance-manager).


### Windows

Download the latest release [here](https://github.com/infrasonar/discovery-agent/releases/latest)
For Windows you want the `discovery-agent-widnows-amd64-x.x.x.zip` file were `x.x.x` represents our latest version number.


## Usage

You can run the discovery agent as a one-off scan like this:

```
discovery-agent --token <agent-token> --asset-id <asset-id> --network <subnet>
```


* **`<agent-token>`**, enter your agent-token here 
* **`<asset-id>`**, enter the asset ID tou want to use to report the discory results to.
* **`<subnet>`**, the subnet in [CIDR](https://en.wikipedia.org/wiki/Classless_Inter-Domain_Routing) notation

## Additional information

:material-github: [Discovery agent source code](https://github.com/infrasonar/discovery-agent)
