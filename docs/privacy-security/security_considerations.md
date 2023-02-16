# Security considerations

InfraSonar is an infrastructure monitoring platform as a service.

This document outlines some security considerations to take into account when deploying InfraSonar.

Our focus and efforts are aimed at retrieving monitoring data, and sending the collected data securely to the InfraSonar cloud platform for further analysis.

!!! note
    InfraSonar is not an IT automation tool and cannot make changes to a monitored environment. However, some InfraSonar implementations use the InfraSonar API to integrate with an on-premises automation solution such as Ansible, ensuring a single point of truth for configuration management.

## Context

To properly read this security considerations page, it is essential to keep the following context in mind:

- InfraSonar monitoring data is collected through:
  -  [Probes](../collectors/probes/index.md) running in a Docker container on the monitoring [appliance](../collectors/probes/appliance/index.md).
  - Custom collectors are sending data via the [InfraSonar API](https://docs.oversig.ht/api/data/insert-data/).
- Collected data is sent to the InfraSonar platform for further analysis and user consumption in the InfraSonar frontend.

The [platform guide](../introduction/platform.md) explains this architecture further.

## InfraSonar design principles

Our development team adheres to these principles:

1. Use least privilege accounts to access monitoring data when possible.
2. Use vendor-documented standards such as API or management protocols to query data.
3. When credentials are required, these should be stored encrypted on the monitoring appliance.
4. The customer or managed service provider controls access to InfraSonar data.
5. Avoid third-party libraries when possible.
6. Set up security scanners in our version control system for all projects.
7. Security-related issues take precedence over all other matters.

## The three states of data

InfraSonar processes massive amounts of monitoring data stored for historical analysis, such as trending.
We strive to treat all collected data as if it were sensitive data.

InfraSonar data can be in one of 3 so-called states.

**Data at rest**

:   _Data currently not being accessed, which is stored on a physical or logical medium._

    InfraSonar stores data in it’s cloud platform on AES256 encrypted disks. The appliance itself has no disk encryption but uses file-based encryption where possible.

**Data in transit**

:   _Data that “travels” between devices. The most straightforward example is emails that are in transit._

    All data sent between InfraSonar services is SSL encrypted. Data collected by probes is potentially unencrypted, as not all technologies used to collect monitoring data use encryption. SNMP v2c is an example where data is sent without any encryption.

**Data in use**

:   _Data actively in use by one or more applications for analysis or for access/consumption by end-users._

    When data is in use, it needs to be in a readable format; this is especially true for data consumed by end-users. Automated data processing takes place in the datacenters, which have several certifications related to security measurements. These include, but are not limited to:

    - ISO/IEC 27001
    - ISO/IEC 27017
    - ISO/IEC 27018
    - SOC 2
    - SOC 3

    The InfraSonar appliance has no special security measures other than those of the environment in which the appliance is used to protect data.

## Data classification

We use the following data classification for InfraSonar and InfraSonar related data:

**:octicons-no-entry-fill-12: Restricted**

:  - Configuration data stored on the monitoring appliance, as this contains (encrypted) credentials.
   - Log data stored on the appliance, as this potentially contains user ids.
   - InfraSonar accounts lists.

**:material-lock: Sensitive**

:  - Time series data and performance metrics collected on monitored assets / hosts.
   - State data.
   - InfraSonar platform source code.
   - CRM data.
   - Contracts.

**:material-folder-open: Internal**

:   - InfraSonar back office, such as invoices.
    - InfraSonar support incidents.
    - InfraSonar Slack and email communication.

**:material-eye-outline: Public**

:   - InfraSonar open source code:
        - SiriDB - Time series database used in InfraSonar.
        - ThingsDB - NoSQL database used in InfraSonar.
        - InfraSonar probes.
    - InfraSonar documentation.

## Monitoring appliance

The monitoring appliance on which the InfraSonar probes and InfraSonar agentcore are deployed requires extra attention, as many vendors do not support a 'least privilege' approach to collecting monitoring data. As such, the probes often require the use of highly privileged accounts and sometimes even root or administrator accounts.

Our recommendations:

- Set up SSH Passwordless Authentication.
- Disable User SSH Passwordless Connection Requests.
- Disable SSH Root Logins.
- Use SSH Protocol 2.
- Set SSH Connection Timeout Idle Value.
- Limit SSH Access to Certain Users.
- Configure a Limit for Password Attempts.
- Update the underlying Linux operating system frequently.
- Perform a daily pull command for new InfraSonar containers.
- Use the `latest` tag for InfraSonar containers unless otherwise specified by InfraSonar support.
- If your company requires version pinning, please let us know so we can explicitly notify you when we release probe updates.
- Frequently update the password used by InfraSonar probes.
- Use disk encryption when possible.
