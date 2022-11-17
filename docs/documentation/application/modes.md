# Modes

Modes can be used to change the behavior of a container or an asset or group of assets.

mode                    | description
------------------------|-----------------------------
normal                  | normal operations, all conditions are evaluated.
maintenance (no alerts) | All asset notifications and alert messages suppressed
disabled (no checks)    | All data send by an agent for this asset is ignored. <br>Any probes / checks configured for this asset are stopped.


## Container

Modes can be set on container level. Effectivly changing the mode for all assets in the container.

Changing the mode on a container can be done via a :material-clock-outline: schedule or via the :fontawesome-solid-folder-tree: container view.

## Asset 

Changing the mode on an asset can be done in the asset configuration.

## API

It is also possible to change the mode using our API

* [asset](../../api/asset/set-mode.md)
* [container](../../api/container/set-mode.md)








It is possible to put a host in maintenance mode by adding the :material-label:{.gray-icon} maintenance label using an API request.



!!! warning "The Agent-core API will be deprecated soon"
    The better way is to use the [webserver API](../../api/hosts/add-host-label.md) and even better is to use tasks to remove the :material-label:{.gray-icon} maintenance label after a certain amount of time.

## Linux

Sample script which adds the :material-label:{.gray-icon} maintenance label before a reboot, avoiding notifications while the host is rebooting:

```bash
# Set maintenance label
InfraSonarAppliance="<InfraSonar-AgentCore-IP>"
url="https://$InfraSonarAppliance/api/setHostInMaintenance" 
wget $url -q --no-check-certificate -O /dev/null
/sbin/shutdown -r now
```

Removing the :material-label:{.gray-icon} maintenance label after the reboot can be achieved using this script:

!!! note "Don't forget to set the proper Agent-core IP"
    Replace <InfraSonar-AgentCore-IP> with the IP address or FQDN of the InfraSonar appliance.

```bash
# Remove maintenance label
InfraSonarAppliance="<InfraSonar-AgentCore-IP>"
url="https://$InfraSonarAppliance/api/setHostOutOfMaintenance"
sleep 600
wget $url -q --no-check-certificate -O /dev/null
```

### Crontab glue

Using crontab makes it possible to reboot at a planned time, put the host in maintenance and remove the maintenance label after the reboot.

Store the two scripts above as such, for example:

* `/opt/scripts/reboot-sequence.sh`
* `/opt/scripts/post-reboot.sh`

Ensure the scripts have execute permissions:

```bash
chmod +x /opt/scripts/reboot-sequence.sh
chmod +x /opt/scripts/post-reboot.sh
```

Edit the crontab using: `crontab -e`.

Use the following entries to reboot daily at 23:30:

```
# Reboot at 23:30
30 23    * * *   root bash /opt/scripts/reboot-sequence.sh
# Remove maintance after reboot
@reboot root bash /opt/scripts/post-reboot.sh
```


## Windows

Setting a host in maintenance can also be achieved via PowerShell:

```powershell
<#
.SYNOPSIS
  Set a host in maintenance in InfraSonar
.NOTES
  Version:        1.0
  Author:         Seth Daemen
  Creation Date:  17-12-2015
  Purpose/Change: Initial script development
#>
#Set host in Mainteance

$url= "https://<InfraSonar-AgentCore-IP>/api/setHostInMaintenance" 

$wc = New-Object System.Net.WebClient
#Next line is to avoid certificate errors
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = {$true}
Try {
    $wc.DownloadString($url)
    } 
Catch {
    Write-Warning "$($error[0])"
    }    
```
