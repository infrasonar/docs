# What is InfraSonar

InfraSonar is the brainchild of two IT infrastructure specialists who joined forces with an IT service provider to create an easy-to-maintain, uniform monitoring platform. Using open standards from vendors, the InfraSonar monitoring [appliance](../collectors/probes/appliance/appliance_deployment.md) securely monitors your IT infrastructure.

InfraSonar comes out of the box with many predefined conditions based on years of experience and best practices.

This predefined set of conditions and agent-less monitoring capabilities make for an easy and non-intrusive rollout with minimum effort.

!!! quote "Single source of truth"
    InfraSonar's detailed data collection allows it to serve as your organization's single "source of truth."

## InfraSonar capabilities

* **State monitoring**<br>
  This allows us to monitor whether the status is still in the desired state, detect state changes and even detect missing items such as volumes, services, and software.
* **Performance monitoring**<br>
  Monitors the current state and notifies when a threshold is reached.<br>
  Performance data is stored in our time series database [SiriDB](https://siridb.com) for analysis over time.
* **Analysis**<br>
  Performance data and hit alerts (open & closed) are used for analysis over time.
* **API**<br>
  Utilizing the [InfraSonar API](../../api/overview.md) allows for easy integration with automation platforms, such as [Ansible](https://www.ansible.com/) and [Salt](https://saltproject.io/).
