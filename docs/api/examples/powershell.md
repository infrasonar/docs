# Powershell

This chapter contains example Powershell scripts.

Variable

variable         | explanation
-----------------|-------------------------------------------------
$token           | Token used for [authentication](../authentication.md).
$environmentUuid | Environment [UUID](../uuid.md) used to select the environment.
$duration        | Host [UUID](../uuid.md) used to select the host.

## Set maintenance label

The script below can be used to set the maintenance label for a host and remove it after a period of time (`duration`), in the example we opt a duration of 300 seconds.

See the [authentication](../authentication.md) section on how to obtain a token and the [UUID](../uuid.md) section on how to obtain the correct UUID's

```powershell
# Global parameters

$token = "<oversight-token>"
$environmentUuid = "<oversight-environment-uuid>"
$hostUuid = "<oversight-host-uuid>"
$duration = 300 # Durtation in seconds for the label to stay on the host
$label = "ahtzfmRldGVjdC1hbmFseXplLW5vdGlmeS0wMWFyJAsSCEN1c3RvbWVyIghzeXNhZG1pbgwLEgVMYWJlbBihlMsEDA" # This is the keystring for our maintenance label

function Set-Host-In-Maintenance {
    $reason ="Adding maintenance label for planned reboot"
    $body = "{`"environmentUuid`": `"$environmentUuid`",
              `"hostUuid`": `"$hostUuid`",
              `"label`": `"$label`",
              `"reason`": `"$reason`"
             }"
    $response = Invoke-RestMethod 'https://oversig.ht/api/host/label/add' -Method 'POST' -Headers $headers -Body $body
}

function Plan-Label-Removal {
    $reason ="Removing maintenance label after planned reboot"
    $when = [System.Math]::Truncate((Get-Date -Date (Get-Date).ToUniversalTime() -UFormat %s)) + 300
    # We add 300 seconds as we expect the host to be back in 5 minutes
    $body = "{`"environmentUuid`": `"$environmentUuid`",
              `"hostUuid`": `"$hostUuid`",
              `"label`": `"$label`",
              `"reason`": `"$reason`",
              `"timestamp`": $when
             }"
    $response = Invoke-RestMethod 'https://oversig.ht/api/task/host-label-add' -Method 'POST' -Headers $headers -Body $body
}

### ___MAIN

# Constuct Headers
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Content-Type", "application/json")
$headers.Add("Authorization", "Bearer $token")

# Setting the host in mainteance by adding the maintenance label
Set-Host-In-Maintenance
# Scheduling the removal of the maintancen label
Plan-Label-Removal
```
