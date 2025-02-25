# Credentials

Gathering monitoring data often requires credentials to authenticate against a remote system.

At InfraSonar we have strict [Security Design Principles](../privacy-security/security_considerations.md#infrasonar-security-design-principles) 

We also have additional rules concerning management of credentials:

1. **Least Privilege**: We opt to use accounts with minimal access privileges to access monitoring data whenever possible and opt to use read-only accounts were possible;
2. Credentials are stored securely and never accessible outside the boundary of a [container](./containers.md);
3. Credentials are used over an encrypted connection where possible (_some vendors / protocols don't support this however_)

## Remote appliance manager

The easiest way to manage credentials required for our [probes](../collectors/probes/index.md) is to use our [remote appliance manager](../application/agentcores.md#remote-appliance-manager).

The remote appliance manager encrypts your password in the browser and sends it directly over a secure connection to your appliance.

## Services

Some of our [serivce](../collectors/services/index.md) based collectors require an API token or credentials. These can be directly configured on the asset were this service is deployed on. 

Service credentials are stored securely in our cloud platform on a system on which only specific outbound connections are allowed.  

## IP Whitelisting

Some assets such as the [SNMP collector](../collectors/probes/snmp/index.md) require the IP address from which the asset is queried to be whitelisted.
