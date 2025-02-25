# PHP FPM pool status page

## Introduction

InfraSonar can monitoring the PHP FPM Pool using the FPM status page.

## Deployment

The FPM status page can be enabled by setting the `pm.status_path` configuration parameter in the FPM pool configuration.
Please review the FPM pool documentation for more information.


## Credentials

No credentials are required to view this page.

For security the FPM status page should be restricted to internal requests or known client IPs only as the page reveals request URLs and information about available resources.

Depending on the web server configuration it might be needed to configure the web server to allow requests directly to this path, bypassing any PHP scripts. An example of a configuration for Apache with FPM listening on UDS and pm.status_path set to /fpm-status would look like:

```
<LocationMatch "/fpm-status">
 Order Allow,Deny
 Allow from 127.0.0.1
 ProxyPass "unix:/var/run/php-fpm.sock|fcgi://localhost/fpm-status"
</LocationMatch>
```

After reloading or restarting both FPM and the web server the status page will be accessible from the appliance (as long as the request comes from an allowed IP address if the IP restriction was configured).
