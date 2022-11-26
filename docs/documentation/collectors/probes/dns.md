![DNS-Probe](../../../images/application_probe_dns.png){ width="200" align=right}

# :material-dns-outline: DNS

The DNS probe monitors DNS servers and can even monitor changes to specific DNS records.

## Configuration

Property    | Description
------------|------------------------
FQDN        | FQDN of the DNS record you want to monitor
PTR         | PTR record in `in-addr.arpa` format, see also [this](https://en.wikipedia.org/wiki/Reverse_DNS_lookup) reverse DNS Wikipedia article.
DNS Servers | DNS servers to query (if left empty the DNS from the appliance is used)

### Example configuration

* FQDN: `dns.google.com`
* PTR: `4.4.8.8.in-addr.arpa`
* DNS servers: `8.8.8.8,8.8.4.4`

## Best practices

### Microsoft Active Directory

[source](https://learn.microsoft.com/en-us/troubleshoot/windows-server/networking/verify-srv-dns-records-have-been-created)

Setup a DNS probe to monitor `_ldap._tcp.dc._msdcs.<Domain_Name>` on each DNS server on your domain, where <Domain_Name> is the name of your domain.

#### SRV Records Registered by Net Logon

[source](https://social.technet.microsoft.com/wiki/contents/articles/7608.srv-records-registered-by-net-logon.aspx)


SRV record                                                   | Description
-------------------------------------------------------------|--------------------
_ldap._tcp.DnsDomainName.                                    | Allows a client to locate servers running the LDAP service in the domain of DnsDomainName.
_ldap._tcp. SiteName._sites.<br>DnsDomainName.               | Allows a client to locate servers running the LDAP service in a domain in a site SiteName DnsDomainName. SiteName relative file name, which is stored in the Configuration container in Active Directory.
_ldap._tcp.dc._msdcs.DnsDomainName.                          | Allows a client to find a domain controller in the domain DnsDomainName. All DC register this SRV record.
_ldap._tcp. SiteName.<bn>_sites.dc._msdcs.DnsDomainName.     | Allows a client to find a domain controller in the domain in site SiteName DnsDomainName. All DC register this SRV record.
_ldap._tcp.pdc._msdcs.DnsDomainName.                         | Allows a client to find a domain PDC DnsDomainName. Only PDC server registers this SRV record.
_ldap._tcp.gc._msdcs.DnsForestName.                          | Allows a client to find a DC in the forest DnsForestName. Only GC servers register this SRV record.
_ldap._tcp. SiteName.<br>_sites.gc._msdcs.<br>DnsForestName. | Allows a client to find a GC in the forest Only GC server DnsForestName. owned by this forest register this SRV record
_gc._tcp.DnsForestName.                                      | Allows a client to find a GC in the domain. Only GC servers owned by this forest DnsForestName register this SRV record.
_gc._tcp.SiteName._sites.DnsForestName.                      | Allows a client to find a GC in this forest site SiteName DnsForestName. Only GC servers owned by this forest DnsForestName register this SRV record.
_ldap._tcp.<br>DomainGuid.domains._msdcs.<br>DnsForestName.  | Allows customers to find the DC GUID. A GUID is a 128-bit unique index. Admits when DnsDomainName DnsForestName and changed.
_kerberos._tcp.<br>DnsDomainName<br>.                        | Allows clients to find a Kerberos KDC in that domain: DnsDomainName. All DC register this SRV record.
_kerberos._udp.<br>DnsDomainName<br>.                        | Same as _kerberos ._tcp. DnsDomainName only over UDP
_kerberos._tcp.SiteName._sites.<br>DnsDomainName.            | Allows clients to find a Kerberos KDC in that domain: DnsDomainName site SiteName. All DC register this SRV record.
_kerberos._tcp.dc._msdcs.DnsDomainName.                      | Allows clients to find a DC running a Kerberos KDC's role in that domain: DnsDomainName. All DC with the KDC log this SRV record.
_kerberos.tcp.SiteName._sites.dc._msdcs.<br>DnsDomainName.   | Allows clients to find a DC running a Kerberos KDC's role in that domain: DnsDomainName site SiteName. All DC with the KDC log this SRV record.
_kpasswd._tcp.DnsDomainName.                                 | Kerberos Password Change allows you to search for current domain. All kerberos KDC DC (c) role of the register this SRV record
_kpasswd._udp.DnsDomainName.                                 | Same as _kpassword ._tcp. DnsDomainName only over UDP