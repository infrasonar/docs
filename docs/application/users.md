![User management](../images/application_usermanagement.png){ width="150" align=right}

# :material-account-supervisor-circle: Users

A user with the [ContainerAccess](#material-toggle-switch-outline-containeraccess) rights can manage users.

The **:material-account-supervisor-circle: users** menu option can be used to manage user access to InfraSonar.

!!! Tip
    As with any platform we advise to adhere to the [Principle of least privilege](https://en.wikipedia.org/wiki/Principle_of_least_privilege)

## Authentication

We support user authentication using using one of these cloud identities:

* :material-microsoft: [Microsoft account](https://account.live.com/) (*this can be a work or personal account*)
* :material-google: [Google account](https://www.google.com/account/about/) (*this can be a personal or Google workspace account*)

!!! Note
    Users can only be added to our platform if they are "known" to us.
    As such a user should fist authenticate once on our platform and from there on the user can be added to a container.

## Authorization

A user's identity can be authorized on a [container](child_containers.md) using a [specific permissions](#permissions).

!!! Note
    Also note a user with [ContainerAccess](#material-toggle-switch-outline-containeraccess) rights can never assign more permissiong the assigned to this user.



### How-to

#### Add user

You can only add a user to a container if the user is "known" in InfraSonar, so a new user needs to logon using a Microsoft or Google account prior granting the user access.

Users can be added using the email address they used to authenticate with.

#### Access permissions for regular users

We suggest the following set of access permissions for regular users:

* :material-toggle-switch-outline: [Is member](#material-toggle-switch-outline-is-member)
* :material-toggle-switch-outline: [View](#material-toggle-switch-outline-view)
* :material-toggle-switch-outline: [AlertChange](#material-toggle-switch-outline-alertchange)

Option we suggest adding:

* :material-toggle-switch-outline: [AlertAssign](#material-toggle-switch-outline-alertassign) as this allows the user to assign alerts to users.
* :material-toggle-switch-outline: [ReportingView](#material-toggle-switch-outline-reportingview), access to reports can help users to get a better understanding.
* :material-toggle-switch-outline: [RuleEmail](#material-toggle-switch-outline-ruleemail), allowing users to setup email rules for themselves can be beneficial.


## Permissions

### **:material-toggle-switch-outline: Is member**
Allows alerts to be assigned to this user, makes the user "visible" for alert assignment.

### **:material-toggle-switch-outline: View**
Required for viewing this container.

### **:material-toggle-switch-outline: Billing**
Required for viewing the credits tab on this container <br>_(only when credits are available on the on the container)_.

### **:material-toggle-switch-outline: InsertCheckData**
Required for inserting data using the API (used by agents).

### **:material-toggle-switch-outline: AgentcoreConnect**
Required for AgentCores to connect to the hub.

### **:material-toggle-switch-outline: AssetManagement**
* Required for changing the container mode (and/or schedule container mode);
* Required for changing the asset mode (and/or schedule asset mode);
* Required for creating new assets;
* Required for removing assets (including delete from trash);
* Required for changing asset configuration (including labels and collector related configuration).

### **:material-toggle-switch-outline: AlertAssign**
:   Required for assigning alerts.

### **:material-toggle-switch-outline: AlertChange**
:   Required for closing alerts;
    Required for adding comments to alerts.

### **:material-toggle-switch-outline: API**
Required for any API request.

### **:material-toggle-switch-outline: ContainerManagement**
* Required for adding child containers to this container;
* Required for removing this container;
* Required for renaming this container.

### **:material-toggle-switch-outline: ContainerAdmin**
* Required for creating/changing/removing labels within this container;
* Required for creating/changing/removing conditions within this container;
* Required to create/change/remove a DutyCalls service to this container.

### **:material-toggle-switch-outline: ContainerAccess**
* Required for managing user access to this container;
* Required for managing tokens on this container.

### **:material-toggle-switch-outline: CheckManagement**
Required for enable/disable/configure checks per collector on assets.

### **:material-toggle-switch-outline: TimeSeriesManagement**
Required for enable/disable time-series for this container.

### **:material-toggle-switch-outline: RuleManagement**
Required for managing _all_ rules on this container.<br>_(including rules for webhooks and rules for other users)_

### **:material-toggle-switch-outline: RuleEmail**
Required for creating a personal email rule on this container.

### **:material-toggle-switch-outline: PurgeTimeSeries**
Required for purging dead-time-series within this container.


### **:material-toggle-switch-outline: ViewLog**
Required for viewing logging.


### **:material-toggle-switch-outline: ReportingView**
Required for viewing reports.


### **:material-toggle-switch-outline: ReportingAdmin**
Required for managing reports.


### **:material-toggle-switch-outline: ContainerTokens**
Required for managing container tokes.


### **:material-toggle-switch-outline: RulePhone**
Required for creating a personal phone rule like _SMS_, _PhoneCall_ or _WhatsApp_ on this container.

### **:material-toggle-switch-outline: Webhooks**
Required for managing and viewing Webhooks.<br>
Be careful with this privilege as webhooks might contain sensitive information like API keys.<br>
_(This auth flag is **not** required for creating rules using webhooks)_
