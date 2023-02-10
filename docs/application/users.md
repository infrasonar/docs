![User management](../images/application_usermanagement.png){ width="150" align=right}

# Users

## Authentication

We support user authentication using using one of these cloud identities:

* :material-github: [GitHub account](https://github.com)
* :material-microsoft: [Microsoft account](https://account.live.com/) (*this can be a work or personal account*)
* :material-google: [Google account](https://www.google.com/account/about/) (*this can be a personal or Google workspace account*)


!!! Tip
    Users can only be added to our platform if they are "known" to us.
    As such a user should fist authenticate once on our platform and from there on the user can be added to a container.

## Authorization

A user's identity can be authorized on a container [container](container.md) using a specific role.

### Authorization flags


`Alerts can be assigned to this user ("Is member")`
:   * Allows alerts to be assigned to this user, makes the user "visible" for alert assignment.


`View`
:   * When applied to the root container, this gives sysadmin access;
    * Required for viewing this container.

`Billing`
:   * Required for viewing the credits tab on this container (only when credits are available on the container).

`InsertCheckData`
:   * Required for inserting data using the API (used by agents).

`AgentcoreConnect`
:    * Required for AgentCores to connect to the hub.

`AssetManagement`
:   * Required for changing the container mode (and/or schedule container mode);
    * Required for changing the asset mode (and/or schedule asset mode);
    * Required for creating new assets;
    * Required for removing assets (including delete from trash);
    * Required for changing asset configuration (including labels and collector related configuration).

`AlertAssign`
:   * Required for assigning alerts.

`AlertChange`
:   * Required for closing alerts;
    * Required for adding comments to alerts.

`API`
:   * Required for any API request.

`ContainerManagement`
:   * Required for adding child containers to this container;
    * Required for removing this container;
    * Required for renaming this container.

`ContainerAdmin`
:   * Required for creating/changing/removing labels within this container;
    * Required for creating/changing/removing conditions within this container;
    * Required to create/change/remove a DutyCalls service to this container.

`ContainerAccess`
:   * Required for managing user access to this container;
    * Required for managing tokens on this container.

`CheckManagement`
:   * Required for enable/disable/configure checks per collector on assets.

`TimeSeriesManagement`
:   * Required for enable/disable time-series for this container.

`RuleManagement`
:   * Required for managing DutyCalls rules on this container;
    * Required for managing Email rules (including rules by other users) on this container.

`RuleEmail`
:   * Required for creating a personal email rule on this container. _(other email rules are only visible when having the admin role)_

`PurgeTimeSeries`
:   * Required for purging dead-time-series within this container.

`ViewLog`
:   * Required for viewing logging.

`ConnectWiseManageAddOn`
:   * Required to use the CWM_ADDON on this container; (only if the container has CWM configured).