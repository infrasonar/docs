![Microsoft Azure](../../images/service_azure.png){ width="150" align=right}

# Microsoft Azure

## Introduction

!!! danger "Preview"

    The Azure service is a preview release.<br>
    Contact [InfraSonar support](../../support/index.md) if you want to get involved in testing our preview release.

## Features

Add the moment the following Azure resources are supported:

* Virtual machine
* Private DNS zone
* DNS zone
* Regular Network Interface
* Public IP address

## Configuration

Our Azure service needs the following properties:

* Directory (tenant) Id
* Application (client) Id
* Client secret value
* Subscription Id
* Resource group Name

In the next paragraphs we describe how to setup the Azure service and how to retrieve the required properties.

### Prepare your Azure environment

Two steps are required to prepare your Azure environment for the InfraSonar Azure service.

1. Register the InfraSonar service as an Azure app
2. Authorize the registered app to the resources you want to monitor

Open the Azure portal (https://portal.azure.com/) using an account with sufficient privileges to register an Azure app and set permissions.

#### Create an app registration

1. From the main menu, open **Azure Active Directory**
2. Open **App registrations** from the *Azure Active Directory sub-menu*
3. Select **new registration**
4. Enter the **user-facing display name** e.g., *InfraSonar Azure Service*
5. Who can use this application or access this API: Select **Accounts in this organizational directory only**
6. Click **Register**
7. A new Windows opens, note the following ID's down:
      1. *Application (client) ID*
      2. *Directory (tenant) ID*
8. Click **Add a certificate or secret** next to client credentials
9. Click **New client secret** in the *Client secrets* tab
      1.  Enter a description: e.g.m *InfraSonar azure Service*
      2.  Set an expiration date, note this value down and remember to renew before this date!
      3.  Click **Add**
      4.  Note down the `Value`, note this can not be retrieved again once you close this window!

#### app authorization

An app authorization is required per resource group you want to monitor.

1. Open the resource group containing the Azure resource you want to monitor
2. Note down the **Subscription ID**
3. Open **Access control (IAM)**
4. Select the tab **Role assignments**
5. Click **Add** and then **Add role assignment**
6. Search the **Reader** role from the *Role* tab
7. Open the *Members* tab
8. Ensure Assign access to *User, group, or service principal* is selected
9. Click **Select members**
10. **Search** the name used by the app registration e.g., *InfraSonar Azure Service*
11. **Select** the app and **click** the select button
12. Give an optional description
13. Verify the role assignment and press **Review + assign**

The registered app can now query the Azure portal's resources via the Azure API

!!! note "Rinse and repeat"
    Repeat the above app authorization steps for each resource group containing the resource you want to monitor.

### Deploy the InfraSonar service

1. Open the InfraSonar environment you want to add the resource to
2. Click **add asset** or use an existing asset
3. Add the **azure** collector
4. Open the **azure** collector tab and enter the required information
   1. Directory (tenant) Id
   2. Application (client) Id
   3. Client secret value
   4. Subscription Id
   5. Resource group Name, *Resource group name as used in Azure*
5. Optional, deselect checks you don't want to use.