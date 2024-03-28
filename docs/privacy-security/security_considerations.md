#:material-security:  Security Overview

InfraSonar is an infrastructure monitoring platform as a service. This document outlines security considerations to keep in mind when deploying InfraSonar. Our primary focus is on securely retrieving monitoring data and sending it to the InfraSonar cloud platform for analysis.

## Data Collection and Use

* InfraSonar collectors (agents, probes, and services) gather data relevant to the status and performance of the monitored device. We do not collect extraneous data.
* Our open-source collectors allow for easy auditing of data retrieval methods.

!!! Note
    InfraSonar is not an IT automation tool and cannot modify the monitored environment. However, some implementations use the InfraSonar API to integrate with on-premises automation solutions like Ansible, ensuring a central configuration management point.

## Understanding the Context

For a clear understanding of this security document, consider the following:

* InfraSonar collects monitoring data through:
    * [Probes](../collectors/probes/index.md) running in Docker containers on the monitoring [appliance](../collectors/probes/appliance/index.md).
    * [Agents](../collectors/agents/index.md) sending data via the [InfraSonar API](https://docs.infrasonar.com/api/overview/)
    * [Services](../collectors/services/index.md) running in the InfraSonar cloud platform that autonomously retrieve monitoring data.
* Collected data is sent to the InfraSonar platform for analysis and user access through the InfraSonar frontend.
* The platform architecture is explained in more detail in the [Platform Guide](../introduction/platform.md).

## InfraSonar Security Design Principles

Our development team adheres to the following security principles:

* **Least Privilege**: Use accounts with minimal access privileges to access monitoring data whenever possible.
* **Vendor Standards**: Utilize vendor-documented standards (APIs or management protocols) to query data.
* **Credential Storage**: When credentials are required, store them encrypted on the monitoring appliance.
* **Customer Data Control**: The customer or managed service provider controls access to InfraSonar data.
* **Minimize Third-Party Libraries**: Avoid using third-party libraries whenever possible.
* **Security Scanning**: Integrate security scanners into our version control system for all projects.
* **Security Issue Prioritization**: Security vulnerabilities are addressed with the highest priority.

## Data States

InfraSonar processes large amounts of monitoring data used for historical analysis, such as identifying trends. We strive to secure all collected data as if it were sensitive.

InfraSonar data can exist in three states:

* **Data at Rest**: Data not currently being accessed, stored on a physical or logical medium. InfraSonar stores data on AES256 encrypted disks within its cloud platform. The appliance itself does not have disk encryption but uses file-based encryption where possible.
* **Data in Transit**: Data transferred between devices. Encrypted SSL is used for all data communication between InfraSonar services. Data collected by probes might be unencrypted, as some data collection technologies don't support encryption (e.g., SNMP v2c).
* **Data in Use**: Data actively used by applications for analysis or user access. Readable data formats are necessary for data in use, especially for end-user consumption. Automated data processing occurs in data centers that comply with various security certifications, including (but not limited to):
    * ISO/IEC 27001
    * ISO/IEC 27017
    * ISO/IEC 27018
    * SOC 2
    * SOC 3

The InfraSonar appliance relies on the security measures of the environment it's deployed in to protect data at rest.

## Data Classification
InfraSonar data is classified as follows:

* **:octicons-no-entry-fill-12: Restricted**
    * Configuration data containing (encrypted) credentials stored on the monitoring appliance.
    * Log data potentially containing user IDs stored on the appliance.
    * InfraSonar account lists.
* **:material-lock: Sensitive**
    * Time series data and performance metrics collected on monitored assets/hosts.
    * State data.
    * InfraSonar platform source code.
    * CRM data.
    * Contracts.
* **:material-folder-open: Internal**
    * InfraSonar back office data, such as invoices.
    * InfraSonar support incidents.
    * InfraSonar Slack and email communication.
* **:material-eye-outline: Public**
    * InfraSonar open-source code:
        * [SiriDB](https://github.com/siridb), time series database used by InfraSonar.
        * [ThingsDB](https://github.com/thingsdb), backend database used by InfraSonar.
        * [InfraSonar](https://github.com/infrasonar), collectors.
    * InfraSonar documentation


## Securing Your Monitoring Appliance

Since many monitoring vendors don't support "least privilege" data collection, the appliance hosting InfraSonar probes and agentcore requires extra security measures. These probes often rely on privileged accounts, increasing the attack surface.

Here's how to strengthen your monitoring appliance's security:

### SSH Access

* **Enforce SSH Key-Based Authentication**: Eliminate password logins and utilize SSH keys for secure access.
* **Disable Passwordless Login Requests**: Prevent users from requesting passwordless logins.
* **Restrict SSH Root Logins**: Disable root access via SSH entirely.
* **Upgrade to SSH Protocol 2**: Ensure you're using the more secure SSHv2 protocol.
* **Set SSH Session Timeouts**: Automatically disconnect idle SSH connections after a set time.
* **Limit SSH Access**: Restrict access to authorized users or user groups only.
* **Implement Login Attempt Throttling**: Limit login attempts to prevent brute-force attacks.

### System Maintenance

* **Regular OS Updates**: Apply timely updates to your underlying Linux operating system to patch vulnerabilities.
* **Daily InfraSonar Updates**: Utilize a daily pull command to ensure you have the latest InfraSonar container images.
* **Use Latest Tags (Unless Specified)**: By default, leverage the latest tag for InfraSonar containers for automatic updates. Opt-out only if instructed by InfraSonar support due to specific version requirements.
* **Version Pinning Notification**: If your company enforces version pinning, notify InfraSonar support to receive explicit update notifications.
* **Regular Probe Password Rotation**: Change the passwords used by InfraSonar probes frequently.

### Additional Security:

* **Disk Encryption (if possible)**: If your hardware supports it, enable disk encryption for additional data protection.

These recommendations will significantly enhance the security posture of your monitoring appliance and minimize the risk associated with privileged access requirements.