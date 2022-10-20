# SMTP probe

## Description

The SMTP probe consists of three components:

* Email roundtrip
* DNS check
* SMTP connection

### email roundtrip

The InfraSonar email rountrip is a synthetic monitor verifying the complete email flow.

The steps below outline the email roundtip for `example.org`:

1. The first step is to lookup all MX records for `example.org`.
2. The synthetic email monitor sends an email to all MX records.
3. The receiving email server is configured to automatically forward all mail sent to the probe address. In our case `mailroundtrip@example.org` is forwarded to `mailroundtrip@mrt.oversig.ht`.
4. The mail server `mrt.oversig.ht` passes the email to the synthetic monitor.
5. The synthetic monitor extracts timestamps en relevant data from the received email and sends the check result to Oversight for further analysis.


This approach ensures all components such, as DNS, internet connection, email filtering, and email server components involved in receiving and sending email, are part of the measurement.

!!! note MX lookup
    Sending an email to all MX records ensures the email fallback scenarios work when you need to rely on them.


### DNS check

The DNS check verifies if an SPF record is configured and valid.

### SMTP connection

We attempt to connect to each mail server found in the DNS MX lookup.

## Probe configuration

The only required configuration property for the SMTP-probe is the mail domain.
So in our case this would be: **oversig.ht**.

The email domain is used to lookup the MX records, and optional SPF records and starts monitoring these.

As an option, the email roundtrip can be configured by adding a configured email address.

## Labels

### Base label

:material-label:{.gray-icon} # Mailroundtrip

:   Conditions used for the Mailroundtrip check:

    - Blacklist check
    - Check for open relay
    - MX record changes
    - Email roundtrip
    - SPF record status

### Ignore labels

:material-label:{.gray-icon} ≠ open relay

:   Ignores open relay check. Useful when an open relay is **ok**.

:material-label:{.gray-icon} ≠ spf record

:   Ignores the SPF record condition.

## Mail Round Trip

The email roundtrip check is part of the SNMP-probe.

When configured, it sends an email every 5 minutes to a configured email address. This email address is in turn configured to forward the email back to its originator, creating a closed email loop.

### Microsoft Exchange Configuration

The email roundtrip flow works as follows on a Microsoft Exchange infrastructure:

1. The central monitoring server sends an email to a pre-configured user.
2. The Exchange user auto-forwards the message to the email contact, which is the email address used by the central monitoring server.
3. The central server receives and parses the message.

### Detailed configuration guides

* [Google Workspace](smtp_mailroundtrip_google_workspace.md)
* [Microsoft Exchange 2003](smtp_mailrountrip_exchange2003.md)
* [Microsoft Exchange 2010](smtp_mailrountrip_exchange2010.md)

