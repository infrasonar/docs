# VMWare vCenter VMSA-2024-0003

[source](https://support.broadcom.com/web/ecx/support-content-notification/-/external/content/SecurityAdvisories/0/24257)

## Synopsis

Addressing Arbitrary Authentication Relay and Session Hijack Vulnerabilities in Deprecated VMware Enhanced Authentication Plug-in (EAP) (CVE-2024-22245, CVE-2024-22250)


## Impacted Products

VMware Enhanced Authentication Plug-in (EAP)

## Introduction

Arbitrary Authentication Relay and Session Hijack vulnerabilities in the deprecated VMware Enhanced Authentication Plug-in (EAP) were responsibly reported to VMware. Guidance is available on removing this deprecated component from impacted environments.

## Arbitrary Authentication Relay Vulnerability in Deprecated EAP Browser Plugin (CVE-2024-22245)

### Description

The VMware Enhanced Authentication Plug-in (EAP) contains an Arbitrary Authentication Relay vulnerability. VMware has evaluated the severity of this issue to be in the Critical severity range with a maximum CVSSv3 base score of 9.6.

### Known Attack Vectors

A malicious actor could trick a target domain user with EAP installed in their web browser into requesting and relaying service tickets for arbitrary Active Directory Service Principal Names (SPNs).

### Resolution

To address CVE-2024-22245 remove the EAP plugin by following the guidance in KB96442.

### Workarounds

None.

### Additional Documentation

A supplemental FAQ was created for clarification. Please see: https://via.vmw.com/vmsa-2024-0003-qna

### Notes

Deprecation of the EAP was announced in 2021 with the release of vCenter Server 7.0u2.

### Acknowledgements

VMware would like to thank Ceri Coburn from Pen Test Partners for reporting this issue to us.

## Session Hijack Vulnerability in Deprecated EAP Browser Plugin (CVE-2024-22250)
Description

The VMware Enhanced Authentication Plug-in (EAP) contains a Session Hijack vulnerability. VMware has evaluated the severity of this issue to be in the Important severity range with a maximum CVSSv3 base score of 7.8.

### Known Attack Vectors

A malicious actor with unprivileged local access to a windows operating system can hijack a privileged EAP session when initiated by a privileged domain user on the same system.

### Resolution

To address CVE-2024-22250 remove the EAP plugin by following the guidance in KB96442.

### Workarounds

None.

### Additional Documentation

A supplemental FAQ was created for clarification. Please see: https://via.vmw.com/vmsa-2024-0003-qna

### Notes

Deprecation of the EAP was announced in 2021 with the release of vCenter Server 7.0u2.

### Acknowledgements

VMware would like to thank Ceri Coburn from Pen Test Partners for reporting this issue to us.


 

## References

- [Fixed Version(s) and Release Notes](https://kb.vmware.com/s/article/96442)

Mitre CVE Dictionary Links:

- https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-22245
- https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2024-22250

FIRST CVSSv3 Calculator:

- [CVE-2024-22245](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:N/AC:L/PR:N/UI:R/S:C/C:H/I:H/A:H)
- [CVE-2024-22250](https://www.first.org/cvss/calculator/3.1#CVSS:3.1/AV:L/AC:H/PR:L/UI:N/S:C/C:H/I:H/A:H)
