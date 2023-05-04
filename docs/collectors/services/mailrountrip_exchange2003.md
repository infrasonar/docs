# Microsoft Exchange 2003

Start the "Active Directory Users and Computers" tool on a server, which also contains the Exchange 2003 management tools. Usually the exchange or SBS server.

## Create a receiving mailbox user

1. Create a new user in the for your organization correct OU:
    1. Provide the **Full name**. We recommend using: *Mail Round Trip Monitoring Receive mailbox*.
    2. Provide the **User logon name**. We recommend: *mailroundtrip*.
    3. Click on **Next** to continue.
2. Password options:
    1. Enter a secure password. This password is not used and can be changed anytime.
    2. Select "User cannot change password" and "Password never expires".
    3. Click on **Next** to continue.
3. Create the actual mailbox:
    1. Usually you can leave this *default*. Adjust the Server and mailbox store if required.
4. Finish the creation of the user:
    1. Verify the configuration.
    2. Click on **Finish** to finalize the user creation process.

## Create a return mail contact

Add a mail contact. This contact is required to forward the mail back to the monitoring host.

1. Right click in the organization unit where you want to create the mail contact.
2. Select **Cew** -> **Contact**.
3. Enter the contact details:
   1. Provide a **Full name**, we suggest: *Mail Round Trip Monitoring Return Address*.
   2. Click on **Next** to continue.
4. Add the SMTP address:
    1. Click on **Modify**:
        1. Select **SMTP Address**.
        2. Click on **OK**.
    2. Enter the return email address:
        1. Enter the return mail address in the E-mail address field: *mailroundtrip@mrt.infrasonar.com*.
        2. Click on **OK**.
    3. Finish:
        1. Verify the settings.
        2. Click on **Next** to continue.
        3. Click on **Finish**.

## Hide the return mail contact

We suggest hiding the contact from the address-book, so details will not be shown to end-users.

1. Right-click on the *Mail Round Trip Monitoring Return Address* contact you just created and select **Properties**.
2. Open the **Exchange advanced** tab.
3. Select **Hide from Exchange address lists**.
4. Click on **OK**.

## Modify the receive mailbox user

1. Double click on the previously created *Mail Round Trip Monitoring Receive mailbox* user.
2. Open the **Exchange Features** tab:
    1. **Disable** all features.
3. Open the **Exchange Advanced** tab:
    1. Enable **Hide from Exchange address lists**.
4. Open the "Exchange General" tab:
    1. Click on **Delivery** options.
    2. Click on **Modify**.
    3. Enter the **Mail Round Trip Monitoring Return Address**.
5. Click on **Ok** three times.
