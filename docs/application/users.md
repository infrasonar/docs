![User management](../images/application_usermanagement.png){ width="150" align=right}

# Users

## Authentication

We support user authentication using using one of these cloud identities:

* :material-microsoft: [Microsoft account](https://account.live.com/) (*this can be a work or personal account*)
* :material-google: [Google account](https://www.google.com/account/about/) (*this can be a personal or Google workspace account*)


!!! Tip
    Users can only be added to our platform if they are "known" to us.
    As such a user should fist authenticate once on our platform and from there on the user can be added to a container.

## Authorization

A user's identity can be authorized on a [container](child_containers.md) using a specific role.

### Authorization flags

**<div style="width:40px">Flag</div>**              | **Description**
----------------------------------------------------|--------------------
`Alerts can be assigned to this user ("Is member")` | Allows alerts to be assigned to this user, makes the user "visible" for alert assignment.
`View`                                              | Required for viewing this container.
`Billing`                                           | Required for viewing the credits tab on this container (only when credits are available on the container).
`InsertCheckData`                                   | Required for inserting data using the API (used by agents).
`AgentcoreConnect`                                  | Required for AgentCores to connect to the hub.
`AssetManagement`                                   | Required for changing the container mode (and/or schedule container mode);<br>Required for changing the asset mode (and/or schedule asset mode);<br>Required for creating new assets;<br>Required for removing assets (including delete from trash);<br>Required for changing asset configuration (including labels and collector related configuration).
`AlertAssign`                                       | Required for assigning alerts.
`AlertChange`                                       | Required for closing alerts;<br>Required for adding comments to alerts.
`API`                                               | Required for any API request.
`ContainerManagement`                               | Required for adding child containers to this container;<br>Required for removing this container;<br>Required for renaming this container.
`ContainerAdmin`                                    | Required for creating/changing/removing labels within this container;<br>Required for creating/changing/removing conditions within this container;<br>Required to create/change/remove a DutyCalls service to this container.
`ContainerAccess`                                   | Required for managing user access to this container;<br>Required for managing tokens on this container.
`CheckManagement`                                   | Required for enable/disable/configure checks per collector on assets.
`TimeSeriesManagement`                              | Required for enable/disable time-series for this container.
`RuleManagement`                                    | Required for managing _all_ rules on this container.<br>_(including rules for webhooks and rules for other users)_
`RuleEmail`                                         | Required for creating a personal email rule on this container.
`PurgeTimeSeries`                                   | Required for purging dead-time-series within this container.
`ReportingView`                                     | Required for viewing reports.
`ReportingAdmin`                                    | Required for managing reports.
`ViewLog`                                           | Required for viewing logging.
`ContainerTokens`                                   | Required for managing container tokes.
`RulePhone`                                         | Required for creating a personal phone rule like _SMS_, _PhoneCall_ or _WhatsApp_ on this container.
`Webhooks`                                          | Required for managing and viewing Webhooks.<br>Be careful with this privilege as webhooks might contain sensitive information like API keys.<br>_(This auth flag is **not** required for creating rules using webhooks)_
