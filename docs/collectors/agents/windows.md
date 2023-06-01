![Software Package](../../images/windows_logo.png){ width="150" align=right}

# :material-microsoft-windows: Microsoft Windows agent

Download the Microsoft Windows agent from here:

[:material-download: WindowsAgentSetup.msi](https://github.com/infrasonar/windows-agent/releases/download/v1.0.9/WindowsAgentSetup.msi)

This will install the InfraSonarAgent _(Infrasonar Windows agent)_ on you computer.

The next step is to reboot your computer or start the service manually.

Most likely the service will **not** yet start, and this is because you need to provide the service with a valid agent [token](../../api/authentication.md).

This, and other messages can be checked in the Event Viewer _(Windows Logs/Application)_
![eventvwr](../../images/windows-applog-eventvwr.png)


Open the registry and add your agent Token:

![registry](../../images/window-registry-token.png)

!!! quote "Configure your asset Id"
    If you already have an Asset Id, you can configure set in the registry. When the `AssetId` registry key is 0, the agent will create a new asset once the service starts.


Now start the service again _(or simply reboot the computer)_.


!!! tip "More debug information"
    If you want more debug information in the Event Viewer, you can also add a `Debug` registry key of type `RED_DWORD` and set the value to `1`.

## Additional information

:material-github: [Windows agent source code](https://github.com/infrasonar/windows-agent)
