# Customizations
InfraSonar allows you to customize default behaviors by setting Container Properties.

## Inheritance Model Explained
Properties defined on a parent container are automatically inherited by all its child containers. This means you can define your organization's defaults (e.g., minimum alert solution length) once at the top-level container, and all underlying containers will respect those settings without further configuration.

## Customization Properties
The table below details the available properties for customizing asset, alert, and container behavior.

Property  | Type  | Default | Description
--------- | ----- | ------- | -----------
`infrasonar_asset_default_kind` | String | `'Asset'` | The default Asset Kind used when creating a new asset through the GUI. Refer to the [Set Asset Kind API page](../api/asset/set-kind) for a list of valid kinds.
`infrasonar_alert_minimum_solution_length` | Int | `60` | The minimum number of characters required to consider a note a valid solution when closing an alert. _(Must be $\geq 1$)_.
`infrasonar_alert_default_is_solution` | Bool | `true` | Controls whether the _"Mark as Solution"_ checkbox is selected by default when closing an alert.
`infrasonar_container_default_mode_duration` | Int (enum) | `0` _(Indefinitely)_ | Default duration used when changing a container's operational mode via the GUI. See [Duration Enumerator](#duration-enumerator).
`infrasonar_asset_default_mode_duration` | Int (enum) | `0` _(Indefinitely)_ | Default duration used when changing an asset's operational mode via the GUI. See [Duration Enumerator](#duration-enumerator).
`infrasonar_rule_default_mode_duration` | Int (enum) | `0` _(Indefinitely)_ | Default duration used when changing the enabled/disabled status of a rule via the GUI. See [Duration Enumerator](#duration-enumerator).

## Duration Enumerator
For all properties requiring a mode or status change duration, use one of the following integer values:

Value | Description
----- | -----------
`0`   | Indefinitely
`1`   | 15 minutes
`2`   | 30 minutes
`3`   | 1 hour
`4`   | 2 hours
`5`   | 4 hours
`6`   | 8 hours
`7`   | 1 day


