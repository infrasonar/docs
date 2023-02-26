# Credentials

Some InfraSonar probes require configuration and/or credentials to execute / authenticate its queries. A good example is the WMI-probe that requires Windows domain credentials to perform WMI queries.

Credentials are stored in a [yaml](https://en.wikipedia.org/wiki/YAML) formatted file on the [appliance](index.md) hosting the InfraSonar probes.

## infrasonar.yaml basics

The `infrasonar.yaml` file has a straighforward structure allowing probe specific configurations and per asset deviations from a default configuration.

The basic structure looks like this:

```yaml title="infrasonar.yaml"
exampleProbe:
  config:
    username: alice
    password: "a secret"
  assets:
  - id: 123
    config:
      username: bob
      password: "my secret"
  - id: [456, 789]
    config:
      username: charlie
      password: "other secret"
otherProbe:
  use: exampleProbe
```

The `infrasonar.yaml` file where the credentials are stored can be found in the `data/config` folder, on an out of the box implementation this file is stored here: `/etc/infrasonar/data/config`

### Configuration file breakdown

When applicable a probe has it's own section consisting of the probe name and a configuration for that probe.

```yaml
exampleProbe:
```

The `config` section contains the default probe configuration used by all probes if no exceptions are defined.
The probe specific sections in this chapter describe the individual options per probe.

```yaml
  config:
    username: alice
    password: "a secret"
```

Asset specific configuration can be added by adding a `assets` section and assigning assets to this section by providing the asset-id using the `id` property, this can either be one asset or a list of assets.

```yaml
  assets:
  - id: 123
    config:
      username: bob
      password: "my secret"
  - id: [456, 789]
    config:
      username: charlie
      password: "other secret"
```

`use` is a special property to indicate a probe should use the config from another probe. An example for this are the vendor specific SNMP probes we offer.

```yaml
otherProbe:
  use: exampleProbe
```

## Local configuration

Another nice way to utilize the `yaml` file is to provide a configuration section and use the local configuration option in our UI to point the asset to this specific section.

### Example

In this example we use a specific account in the domain `example.com` this account can then we used in any probe using the local configuration option.

```yaml
example.com:
  config:
    username: "alice@example.com"
    password: "a secret"
```

Now we can use `example.com` when we configure an asset in the UI.

![Local configuration](../../../images/application_local_configuration.png){ width="500"}




## Security considerations

!!! danger "unreadable, not truly encrypted."

    WARNING: InfraSonar will make `password` and `secret` values unreadable but this must not be regarded as true encryption as the encryption key is publicly available.


In the examples below the password is shown in plain text; InfraSonar however encrypts the password once it sees the file has been changed.

Resulting in an **encrypted** section in the **password** section:

```yaml title="encrypted password example"
wmi:
  config:
    username: administrator
    password:
      encrypted: !!binary |
        Z0FBQUFBqmppaWFKblBwbGVIVV72ckFKZFRZRmItX0pYNlpRYnRsT2pLRG1vS2ZjV1lfSExrbi1J
        Uy1LQjhZcVZCAXhCMG5jUmRDd1EteE5Za3duQ1VMbGw3U2JXX3BWSkE9PQ==
```


## Probe specifics

For most probes it is sufficient to provide a `username` and `password`; we outlined probes with a more distinct configuration here:

### SNMP

The SNNP probe supports SNMPv1, SNMPv2c, and SNMPv3


```yaml
snmp:
  config:
    community: public
  assets:
  - id: 123
    config:
      community: other
      version: 2c
  - id: 456
    config:
      version: "1"
      community:
        secret: not_so_public
  - id: [789, 012]
    config:
      version: "3"
      username: alice
      auth:
        # auth is optional; type USM_AUTH_NONE is used when omitted.
        # supported: USM_AUTH_HMAC96_MD5, USM_AUTH_HMAC96_SHA or USM_AUTH_NONE
        type: USM_AUTH_HMAC96_SHA
        password: "my secret password"
      priv:
        # priv is optional; type USM_PRIV_NONE is used when omitted.
        # supported: USM_PRIV_CBC56_DES, USM_PRIV_CFB128_AES or USM_PRIV_NONE
        type: USM_PRIV_CFB128_AES
        password: "my secret password"
snmp-synology:
  use: snmp
```

`version` supports the following values:

- `1` for SNMPv1
- `"2c"` for SNMPv2c
- `3` for SNMPv3

Community strings are not encrypted when used as such:

```yaml
      community: other
```

It is possible though to encrypt the community strings on the appliance by indicating the string is **secret** as such:

```yaml
      community:
        secret: not_so_public
```

This results upon save in community string being encrypted:

```yaml
      community:
        secret:
          encrypted: !!binary |
            Z0FBQUFBQmptMEhGZ0FhTGJZNFNTckZKdXRWaVpKT0RzMzBERlJGUW1MVGVCVHNmTE15eVlOMTVD
            dGZWU1VEYUtPN2V4cWdOeGdoYlB1M29ua2JTZzNuQVlqU09EM0Z2c2c9PQ==
```

### WMI

The WMI probe uses a straightforward configuration as shown below.

When Microsoft Active directory accounts are used the **username** can be either in domain format `domain\infrasonar_service_account` or use the UPN format: `infrasonar_service_account@domain.something`

An asset specific configuration can be useful for non domain joined servers.

```yaml
wmi:
  config:
    username: alice
    password: "a secret"
  assets:
  - id: 123
    config:
      username: domain\bob
      password: "my secret"
  - id: [456, 789]
    config:
      username: charlie@domain.org
      password: "other secret"
```

## FAQ

**Is it possible to copy credentials?**<br>
Yes credential files can be exchanged between appliances belonging to the some InfraSonar container.

**I note my credentials are not being encoded?**<br>
Check if you did not configure a duplicate section, see this simplified example:
```yaml hl_lines="1 5"
wmi:
  config:
    username: alice
    password: "a secret"
wmi:
  use: something
```
