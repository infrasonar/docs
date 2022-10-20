# User management

## Authentication

We support user authentication using using one of these cloud identities:

* :material-github: [GitHub account](https://github.com)
* :material-microsoft: [Microsoft account](https://account.live.com/) (*this can be a work or personal account*)
* :material-google: [Google account](https://www.google.com/account/about/) (*this can be a personal or Google workspace account*)

## Authorization

A user's identity can be authorized on a container [container](environment.md) using a specific role.

### Roles

The roles that exist in InfraSonar are as follows:

| **Role**     | **Description**                                                                                                                                   |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| **View**     | View only access.                                                                                                                                 |
| **Operator** | View access plus:<br><ul><li>Assign alerts</li><li>Add messages to an alert</li><li>Add or remove labels from a host</li></lu>                    |
| **Admin**    | Operator access plus:<br><ul><li>Add, edit and remove hosts</li><li>Add, edit and remove probes</li><li>Manage users on container level</li></lu> |

!!! note "Member property"
    Each role has an additional `member` property that indicates whether alerts can be assigned to the user. Members are visible in the assignment table.
    The `member` property is helpful for organizations where, for example, InfraSonar administrators do not have an operational role or where specific teams are responsible for a customer.

## Binding users 

An InfraSonar admin can bind these accounts to a [container](environment.md).

1. Navigate to the user's page (:material-account-circle:) in the left navigation drawer.
2. Click on the **Add user** button.
3. Enter the email address of the user you want to authorize and select the role you want to assign to this user.