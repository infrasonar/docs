![Modes](../images/application_modes.png){ width="200" align=right}

# Modes

Modes can be used to temporary change the monitoring operation on a **container** or an **asset** or **group of assets**.

We identify the following modes within the InfraSonar application:

mode          | description
--------------|-----------------------------
`normal`      | normal operations, all conditions are evaluated.
`maintenance` | All asset notifications and alert messages suppressed
`disabled`    | All data send by an agent for this asset is ignored. <br>Any probes / checks configured for this asset are stopped.

!!! tip "Modes in day to day operations"
    Modes are a powerful instrument when performing maintenance on assets as it allows on easy way to temporary stop the monitoring avoiding being flood with messages.

## Mode operations

### Container

Modes can be set on container level. Effectively changing the mode for all assets in the container.

Changing the mode on a container can be done using our a [:material-clock-outline: schedular](schedule.md) or in the :fontawesome-solid-folder-tree: container view.

### Asset 

Changing the mode on an asset can be done while editing :material-pencil: an asset or [:material-clock-outline: scheduled](schedule.md)

### API

It is also possible to change the mode using our API:

* [Change mode on a asset](../api/asset/set-mode.md)
* [Change mode on a container](../api/container/set-mode.md)

