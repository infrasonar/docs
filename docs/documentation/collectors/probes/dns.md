# :material-dns-outline: DNS

## Features

The DNS probe monitors DNS servers and can even montor changes to specifc specific DNS records.

## Configuration

Property    | Description
------------|------------------------
FQDN        | FQDN of the DNS record you want to monitor
PTR         | PTR record in `in-addr.arpa` format, see also [this](https://en.wikipedia.org/wiki/Reverse_DNS_lookup) reverse DNS Wikipedia article.
DNS Servers | DNS servers to query (if left empty the DNS from the appliance is used)

!!! note "Use of appliance DNS server might fail"

    Sometimes using the host DNS configuration does not seem to work correctly within the Docker container.
    We are still investigating this issue and recommend configuring the DNS server property for the time being.

### Example configuration

* FQDN: `dns.google.com`
* PTR: `4.4.8.8.in-addr.arpa`
* DNS servers: `8.8.8.8,8.8.4.4`

## Best practices

### Microsoft Active Directory

Setup a DNS probe to monitor `_ldap._tcp.dc._msdcs.<Domain_Name>` on each DNS server on your domain, where <Domain_Name> is the name of your domain.