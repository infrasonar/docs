![Reporting](../images/application_reporting.png){ width="150" align=right}

# Reporting

## Overview

### Kinds

We identify these three reporting kinds:

* [Alerts and notifications](#alerts-and-notifications)
* [State data](#state-data)
* [Condition](#condition)


### Time schedule

here you can pick the unit of time you want to use as data-window for your report:

* Day
* Week
* Month

And pick for which period you want the report.



Optionally you can choose to repeat the report daily, weekly or monthly.

!!! note "Tips"

    **Editing**<br>
    Editing is only possible for repeating reports. One-off reports can be cloned to be run again using other parameters.

    **Planning ahead**<br>
    It is possible to schedule reports in the future, we advise to enable notifications when doing so.

    **State data**<br>
    Quering state data is due to its nature not possible over a period of time.

### Data

here you can use three filter levels to fine grain which assets are returned in your report.

* **Asset kind filter**<br>You can opt to limit your report to a specific asset kind.
* **Container filter**<br>Allows you to select for which containers you want the report 
* **Label filter**<br>Allows you to filter for which labels you want the report 

## Alerts and notifications

Creates a *pdf* report containing an overview of the alerts and notifications for the selected assets in the selected time frame.

## State data

You can query state data by entering the "path" towards the data: Collector → Check → Type

State data reports can be useful to periodically retrieve data for keeping your CMDB up to date.

### Example

Say you want weekly report containing all relevant certificate information from our [tcp-probe](../collectors/probes/tcp.md)

* collector: `tcp`
* Check: `certificates`
* Type: `sslCert`

Next you can select which metrics should be in your report, default we add all metrics.

Last step is to specify how you want to receive the data, we support `json` and `xlsx` and allow you format the values for better readability or keep them for better processing.

## Condition

A condition report can be used to report when an alerts is opened on a specific condition.

This report shows the following information:

* Container Id
* Container Name
* Asset Id
* Asset Name
* Message
* Severity
* Created on
* Last message
* Last severity
* Last hit
* Owner
* Last action
* Last action datetime
* Last action username
* Last action message
* Closed


!!! note "Tip"

    When you subtract last hit from the created on date you get the duration.
    