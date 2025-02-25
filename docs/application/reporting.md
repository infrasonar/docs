![Reporting](../images/application_reporting.png){ width="150" align=right}

# Reporting

## Overview

### Time schedule

Reports can be scheduled to be delivered at regular intervals:

* Daily
* Weekly
* Monthly

!!! note "Tips"

    **Editing**<br>
    Editing is only possible for repeating reports. One-off reports can be cloned to be run again using other parameters.

    **Planning ahead**<br>
    It is possible to schedule reports in the future, we advise to enable notifications when doing so.

    **State data**<br>
    Quering state data is due to its nature not possible over a period of time.

### Data filers

Data filters can be used to fine grain which assets are returned in your report.

Depending on the report you can use any of these filters:

* **Asset kind filter**<br>You can opt to limit your report to a specific asset kind.
* **Container filter**<br>Allows you to select for which containers you want the report 
* **Label filter**<br>Allows you to filter for which labels you want the report 


## Reports

The following reports are available, we can add additional reports on request.

### Alerts and notifications

This report contains charts for [alerts](./alerts.md) and [notifications](./alerts.md/#notifications) within a selected time period.

### State data

This report shows data for a `collector` / `check` / `type` for a selection of assets.

State data reports can be useful to periodically retrieve data for keeping your CMDB up to date.

### Chart data 

This report generates a PDF-document with charts for a selection of assets.

A useful use case for this report can be to report monthly storage usage.

### Condition hit

This reports shows when and how many time a condition is being hit within a selected time period.

### Condition status 

This reports show the status for a condition (like the effective condition page) for a selection of assets.

### Check status 

This reports show the status for a collector/check for a selection of assets. 

### Phone usage

This report contains information about phone usage within a selected time period.

This reports gives an overview of all external notifications send to a mobile phone via either SMS, WhatsApp or voice message.

### VMware guests

This report contains all VMware Guests based on vCenter or ESX guests-lists combined with assets running the [vmwareguest](../collectors/probes/vmware/vmwareguest.md) collector.

### Hyper-V guests 

This report contains all Hyper-V Guests based on the Hyper-V guests-lists combined with assets running the [hypervguest](../collectors/probes/wmi/hypervguest.md) collector.

### UniFi devices

This report contains all UniFi devices based on the UniFI Controller device lists combined with assets running the [unifidevice](../collectors/probes/unifi.md#unifi-controller) collector.
