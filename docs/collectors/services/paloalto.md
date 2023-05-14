![paloalto-Probe](../../images/probe_paloalto.png){ width="300" align=right}

# Palo Alto

:construction: The Palo Alto service is under development and only available as part of our beta program.

Please [contact us](../../images/contact_us.png) if you want to join this beta.

## Introduction

InfraSonar monitors Palo Alto firewalls using the rest API.

!!! tip "Also available as probe"
    We also offer a [probe](../probes/paloalto.md) to monitor Palo Alto firewalls, this allows you to monitor firewalls using your own InfraSonar appliance.

## Features

## Configuration

### Credentials

The Palo Alto rest API uses a **key** which can be generated for a user. 

!!! danger "Don't use an admin account"

    We strongly recommend creating a read only account specific for monitoring.

#### Get your API key

[source](https://docs.paloaltonetworks.com/pan-os/9-1/pan-os-panorama-api/get-started-with-the-pan-os-xml-api/get-your-api-key)

To generate an API key, make a GET or POST request to the firewall’s hostname or IP addresses using the administrative credentials and type=keygen:

```
curl -k -X GET 'https://<firewall>/api/?type=keygen&user=<username>&password=<password>'
```

Ensure to change

* `<firewall>` with your firewall IP or FQDN
* `<username>` with the username of your readl-only monitoring user
* `<password>` with the password of your readl-only monitoring user

A successful API call returns status="success" along with the API key within the key element:

```xml
<response status="success">
  <result>
    <key>Your_secret_key_is_here</key>
  </result>
</response>
```			

You can test your API key using the following command:

```
curl -k 'https://<firewall>//api/?type=op&cmd=<show><system><info></info></system></show>&key=<apikey>'
```

Ensure to change:

* `<firewall>` with your firewall IP or FQDN
* `<apikey` with the previously generated API key

#### Revoke API keys

You can [revoke all](https://docs.paloaltonetworks.com/pan-os/9-1/pan-os-admin/firewall-administration/manage-firewall-administrators/configure-administrative-accounts-and-authentication/configure-api-key-lifetime.html) currently valid API keys, in the event one or more keys are compromised. To change an API key associated with an administrator account [change the password associated with the administrator account](https://docs.paloaltonetworks.com/pan-os/9-1/pan-os-admin/firewall-administration/manage-firewall-administrators/configure-administrative-accounts-and-authentication/configure-local-or-external-authentication-for-firewall-administrators.html). API keys that were generated before you expired all keys, or a key that was created using the previous credentials will no longer be valid.


#### Configure API Key Lifetime

[Source](https://docs.paloaltonetworks.com/pan-os/9-1/pan-os-admin/firewall-administration/manage-firewall-administrators/configure-administrative-accounts-and-authentication/configure-api-key-lifetime)


An optional step is to configure the API Key Lifetime.

Be aware though that monitoring fails when the API key is expired!

### Service configuration

1. Add the **paloaltosvc** service on your asset
2. Open the **paloaltosvc** configuration tab
3. Enter the address and API key
4. The API key is encrypted before it is send to the InfraSonar backend
5. Click save


