![DNS-Collector](../../images/collector_dns.png){ width="150" align=right}

# DNS

## Introduction

The DNS probe is a synthetic monitor and can even monitor changes to specific DNS records.

## Features 

THe DNS probe can perform forward and reverse DNS queries for an FQDN

## Probe configuration

Property    | Description
------------|---------------------------------------------------------
DNS Servers | DNS servers to query, note all configured DNS servers are queried
FQDN        | FQDN of the DNS record you want to monitor

!!! Note "Reverse DNS lookups"
    Using the special `.arpa.` domain it is possible to perform a reverse DNS lookup. See our [PTR](dns.md#ptr) section for a detailed explanation and examples.
    
### Example configuration

* DNS servers: `8.8.8.8, 8.8.4.4`
* FQDN: `dns.google.com`

## Checks

We support the DNS record types described in our [DNS monitoring guide](../../guides/dns.md#dns-records).

## Additional information

:material-file-find: [DNS Guide](../../guides/dns.md)
:material-github: [DNS probe source code](https://github.com/infrasonar/dns-probe)