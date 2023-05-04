# MailRoundTrip service

## Description

The InfraSonar MailRoundTrip service is a synthetic monitor verifying the complete email flow.
The steps below outline the email roundtrip for `mailroundtrip@example.org`:

1. The first step is to lookup all MX records for `example.org`.
2. Our MailRoundTrip service sends an email to all MX records.
3. The receiving email server is configured to automatically forward all mail sent to the probe address. In our case `mailroundtrip@example.org` is forwarded to `mailroundtrip@mrt.infrasonar.com`.

This approach ensures all components such, as DNS, internet connection, email filtering, and email server components involved in receiving and sending email, are part of the measurement.

!!! note MX lookup
    Sending an email to all MX records ensures the email fallback scenarios work when you need to rely on them.

## Deployment

### Service configuration

The only required configuration property for the MailRoundTrip service is the mail domain.
So in our case this would be: `mailroundtrip@example.org`

### Mail service

The email service you want to monitor `example.org` needs to forward messages send to `mailroundtrip@example.org` to `mailroundtrip@mrt.infrasonar.com`

!!! note Cleanup
    Ensure you forward these emails without storing them in your email database or use a routine to automatically cleanup the messages to avoid digital waste.

### Microsoft Exchange Configuration

The email roundtrip flow works as follows on a Microsoft Exchange infrastructure:

1. The central monitoring server sends an email to a pre-configured user.
2. The Exchange user auto-forwards the message to the email contact, which is the email address used by the central monitoring server.
3. The central server receives and parses the message.

### Detailed configuration guides

* [Google Workspace](mailroundtrip_google_workspace.md)
* [Microsoft Exchange 2003](mailrountrip_exchange2003.md)
* [Microsoft Exchange 2010](mailrountrip_exchange2010.md)

