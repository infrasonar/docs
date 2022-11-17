# User management

## Authentication

We support user authentication using using one of these cloud identities:

* :material-github: [GitHub account](https://github.com)
* :material-microsoft: [Microsoft account](https://account.live.com/) (*this can be a work or personal account*)
* :material-google: [Google account](https://www.google.com/account/about/) (*this can be a personal or Google workspace account*)

## Authorization

A user's identity can be authorized on a container [container](environment.md) using a specific role.

### Authorization flags

#### READ
* When applied to the root container, this gives sysadmin access;
* Required for viewing this container;

#### AUTH_FLAG_BILLING
* Required for viewing the credits tab on this container (only when credits are available on the container);

#### INSERT_CHECK_DATA
* Required for inserting data using the API (used by agents);

#### CORE_CONNECT
Required for AgentCores to connect to the hub;

#### ASSET_MANAGEMENT
* Required for changing the container mode (and/or schedule container mode);
* Required for changing the asset mode (and/or schedule asset mode);
* Required for creating new assets;
* Required for removing assets (including delete from trash);
* Required for changing asset configuration (including labels and collector related configuration);

#### ALERT_ASSIGN
* Required for assigning alerts;

#### ALERT_CHANGE
* Required for closing alerts;
* Required for adding comments to alerts;

#### API
* Required for any API request;

#### CONTAINER_MANAGEMENT
* Required for adding child containers to this container;
* Required for removing this container;
* Required for renaming this container;

#### CONTAINER_ADMIN
* Required for creating/changing/removing labels within this container;
* Required for creating/changing/removing conditions within this container;
* Required to create/change/remove a DutyCalls service to this container;

#### CONTAINER_ACCESS
* Required for managing user access to this container;
* Required for managing tokens on this container;

#### CHECK_MANAGEMENT
* Required for enable/disable/configure checks per collector on assets;

#### TIME_SERIES_MANAGEMENT
* Required for enable/disable time-series for this container;

#### RULE_MANAGEMENT
* Required for managing DutyCalls rules on this container;
* Required for managing Email rules (including rules by other users) on this container;

#### RULE_EMAIL
* Required for creating a personal email rule on this container; _(other email rules are only visible when having the

#### PURGE_TIME_SERIES
* Required for purging dead-time-series within this container;

#### VIEW_LOG
* Required for viewing logging;

#### CWM_ADDON
* Required to use the CWM_ADDON on this container; (only if the container has CWM configured);
