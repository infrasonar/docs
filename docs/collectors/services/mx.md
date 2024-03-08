![Ping](../../images/service_mx.png){ width="150" align=right}

# MX

## Introduction

The MX-service is a service which validates your email configuration.

## Features

We verify the following email DNS records:

- **MX**: A mail exchanger record specifies the mail server responsible for accepting email messages on behalf of a domain name. It is a resource record in the Domain Name System. It is possible to configure several MX records, typically pointing to an array of mail servers for load balancing and redundancy.
- **SPF**: Sender Policy Framework (SPF) is an email authentication method which ensures the sending mail server is authorized to originate mail from the email sender's domain. Additional information can be found [here](https://www.spf-record.com/)
- **DMARC**: Domain-based Message Authentication, Reporting and Conformance (DMARC) is an email authentication protocol. It is designed to give email domain owners the ability to protect their domain from unauthorized use, commonly known as email spoofing. Additional information can be found [here](https://dmarc.org/)
- **DKIM**: DomainKeys Identified Mail (DKIM) is an email authentication method designed to detect forged sender addresses in email (email spoofing), a technique often used in phishing and email spam.
- **MTA_STS**: RFC 8461 called "SMTP MTA Strict Transport Security (MTA-STS)" aims to address the problem of active adversary by defining a protocol for mail servers to declare their ability to use secure channels in specific files on the server and specific DNS TXT records.
- **BIMI**: Brand Indicators for Message Identification or BIMI (pronounced: Bih-mee) is an emerging email specification that enables the use of brand-controlled logos within supporting email clients. BIMI leverages the work an organization has put into deploying DMARC protection, by bringing brand logos to the customer’s inbox. For the brand’s logo to be displayed, the email must pass DMARC authentication checks, ensuring that the organization’s domain has not been impersonated.
You can find the implementation guide [here](https://bimigroup.org/implementation-guide/).

## Probe configuration

Property | Description
---------|------------------------
Domain   | The email domain the service should verify.
Selector | The DKIM selector used by the organization.

## Check specifics

The DKIM check fails with a *check error* if you did not configure the selector. If you have not enabled DKIM yet you should disable this check to clear the check error.
