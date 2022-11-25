# Credentials

Some InfraSonar probes require credentials to authenticate its queries. A good example is the WMI-probe that requires Windows domain credentials to perform WMI queries.

Credentials are stored securely on the appliance at the monitored infrastructure and will only be used within the boundaries of the appliance.


```yaml
# WARNING: InfraSonar will make `password` and `secret` values unreadable but
# this must not be regarded as true encryption as the encryption key is
# publically available.
#
# Example configuration for `myprobe` collector:
#
myprobe:
  config:
    username: alice
    password: "secret password"
  assets:
    - id: 12345
      config:
        username: bob
        password: "my secret"
```

When Microsoft Active directory accounts are used the username can be either in domain format `domain\infrasonar_service_account` or use the UPN format: `infrasonar_service_account@domain.something`

## FAQ

### is it possible to copy credentials?

TODO