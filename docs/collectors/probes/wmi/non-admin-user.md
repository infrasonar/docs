![wmi-probe](../../../images/probe_wmi.png){ width="150" align=right}

# WMI as a non admin user

Using read-only accounts for monitoring is a security best practice. However, Microsoft's implementation of WMI makes this difficult on Windows systems, requiring manual configuration on each asset. This poses challenges for scalability and maintainability, especially in large environments.

We strongly recommend carefully weighing the security risks against the operational overhead of configuring individual read-only access on each monitored Windows asset and potentially missing statuses form services as these potentially are now shown to regular users.

The steps required to accomplish using a non domain admin account are outlined below.


## Create a user

First step is to create a regular AD user without any additional permissions.

## Group policy

The next step is to setup a GPO object to grant the just created user sufficient rights.

1. Open the Group Policy Management console.
2. create a GPO by right-clicking on **Group Policy Objects**.
3. Name the GPO accouding to your company standards.
4. Edit the just created GPO (right-cleck the GPO and select edit).
5. Navigate to **Computer Configuration** --> **Policies** --> **Windows Settings** --> **Security Settings** --> **Local Policies** > **Security Options**.
6. Double-click on the `DCOM: Machine Access Restrictions in Security Descriptor Definition Language (SDDL) syntax` policy and make sure **Define this policy setting** is checked.
7. Choose **Edit Security**. Click Add and type the username you just created, click **Check Names** and then click **OK**.
8. Select the user and check **Local Access** and **Remote Access**. Click **OK** twice.
9. Double click on `DCOM: Machine Launch Restrictions in Security Descriptor Definition Language (SDDL) syntax` policy and make sure **Define this policy setting** is checked.
10. Choose **Edit Security**. Click Add and type the username you just created, click **Check Names** and then click **OK**.
11. Select the user and ensure **Local Launch**, **Remote Launch**, **Local Activation** and **Remote Activation** are checked. Then click **OK** twice.
12. As a last step link the GPO to the appropriate Computers/Servers OU to apply the selected DCOM policies.


!!! note
    If the GPO is not applied, select the **Enforce GPO option** to **yes** for the created GPO in Group policy management console.


## Local configuration

The next steps need to be performed manually on each Windows asset.

Set the correct rights for WMI namespace:

1. Open the WMI management console (`wmimgmt.msc`).
2. Right-click **WMI Control (Local)** and click **Properties**.
3. Open the **Security tab**, then click **Root**, click the **Security** button and click **add**.
4. Underneath **Enter the object names to select**, type the user created above without quotes, click **Check Names**, then click **OK**.
5. Select the user and click **Advanced**.
6. Highlight the row with user in it and click **Edit**.
7. From the **Applies to** drop-down list, select **This namespace and subnamespaces**.
8. Under the **Allow** column, check **Execute Methods**, **Enable Account**, **Remote Enable**, and then click **OK**.
9. Click **OK** to close all windows.

## Set permissions to Service Control Manager Security for Windows Service Monitoring

In order to monitor Windows services you need to grant additional permissions to the just created user as access to the Windows services is controlled by the Security Descriptor of Service Control Manager, which by default is restricted for hardened OS. The below mentioned steps will grant remote access to Service Control Manager in user level, to get the list of services on a server.

### Retrieve the user SID of the User Account

From the asset you want to monitor, open Command Prompt in Administrator mode.
Run the below command to retrieve the user SID. Replace UserName with the user name for the User account.

Ensure to use the name of your created user account 

```
wmic useraccount where name="UserName" get name,sid
```

Example:

```
C:\>wmic useraccount where name="wminoadmin" get name,sid
Name        SID
wminoadmin  S-1-5-21-724513037-2082936978-2164574455-1608
```

Note down the SID. (Ex. `S-1-5-21-724513037-2082936978-2164574455-1608`)
Retrieve the current SDDL for the SC Manager and use it's output to update the SDDL

Run the below command to retrieve the current SDDL:

```
sc sdshow scmanager
```

Example ouput
```
D:(A;;CC;;;AU)(A;;CCLCRPRC;;;IU)(A;;CCLCRPRC;;;SU)(A;;CCLCRPWPRC;;;SY)(A;;KA;;;BA)(A;;CC;;;AC)(A;;CC;;;S-1-15-3-1024-528118966-3876874398-709513571-1907873084-3598227634-3698730060-278077788-3990600205)S:(AU;FA;KA;;;WD)(AU;OIIOFA;GA;;;WD)
```

Next step is to combine this output with the prevously retrieved SID by adding `(A;;CCLCRPWPRC;;; <SID of User> )` before the `S:` of the just retrieved SDDL.

This results in the following command:
```
sc sdset scmanager D:(A;;CC;;;AU)(A;;CCLCRPRC;;;IU)(A;;CCLCRPRC;;;SU)(A;;CCLCRPWPRC;;;SY)(A;;KA;;;BA)(A;;CC;;;AC)(A;;CC;;;S-1-15-3-1024-528118966-3876874398-709513571-1907873084-3598227634-3698730060-278077788-3990600205)(A;;CCLCRPWPRC;;;S-1-5-21-724513037-2082936978-2164574455-1608)S:(AU;FA;KA;;;WD)(AU;OIIOFA;GA;;;WD)
```

When execured the output should be:
```
[SC] SetServiceObjectSecurity SUCCESS
```

If some windows services are still not listed, permissions have to be granted for individual services as below.
For setting permission on **Some missing service** (ServiceName: `someMissingSvc`), run the following command, to get its current SDDL.

```
sc sdshow someMissingSvc
```

Then form the SDDL as in the above step and update it as the following
```
sc sdset someMissingSvc <SDDL formed in above step>
```

Once done, check if the Windows Service is listed. 

### Permissions granted to the user

This will grant the following permissions to the user:

* `CC` - To Get Service's current configuration
* `LC` - To Get Service's current status
* `RP` - To Read Properties/Start the Service
* `WP` - To Write Properties/Stop the Service
* `RC` - To Read the Security Descriptor.