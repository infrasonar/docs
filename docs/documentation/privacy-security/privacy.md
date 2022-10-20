# Privacy

Protecting the privacy of the InfraSonar Platform and its customers is a top priority. This page describes what we do and what you as a user can do to guarantee this privacy as well as possible.

## Data control

Customer data is your data, not InfraSonar’s. We only process your data according to your agreement(s). It is, therefore, also possible to manage and delete all user-related information.

## Data Access and Restrictions

Only a minimum number of InfraSonar employees have access to user data to ensure user privacy.

We recommend following the same policy in your InfraSonar environments. Only give users access to the resources they need.

## Data collection and use

We are transparent about data collection and use. We are committed to transparency, compliance with regulations like the GDPR, and privacy best practices. That is why we only collect data necessary for the platform's functioning. It is up to the user to determine which monitoring data needs to be collected.

In addition, we never sell customer data or service data to third parties.

## Data retention

InfraSonar has the following different retention periods for its data.

### Configuration data

Configuration data such as labels, conditions and authorizations are stored while configured.

When a configuration change is made, we don't retain any history in our logging and backups.

### Time series data

Time series data is stored in SiriDB, part of the InfraSonar cloud platform.

- For actively monitored assets/hosts we store performance data with a retention period of 66 weeks (15 months).
- Time series that have not received any data for three weeks are purged from the database, as these are stale metrics.

### Closed alerts

Closed alerts have a retention period of 8 weeks.

### State data

State data is kept in memory and is considered volatile.

### Backup retention

- SiriDB backups have a four day retention period.
- Configuration data backups have an eight weeks retention period.

## Data localization

All data collected by InfraSonar is stored in the European Union in accordance with the GDPR.
