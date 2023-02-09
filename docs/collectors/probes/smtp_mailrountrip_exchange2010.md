# Microsoft Exchange 2010

Start the Microsoft "Exchange Management Console" on a server which also contains the Exchange 2010 management tools. This console can usually be found on the Microsoft Exchange or SBS server.

## Create a new mailbox

1. Right click on **Mailbox** under *Recipient Configuration*:
    1. Select **New Mailbox**.
    2. Select **User Mailbox**.
    3. Click on **Next**.
    4. Select **New User**.
    5. Click on **Next**.
    6. Provide User Information:
        1. Provide the **Full name**, we recommend using: *Mail Round Trip Monitoring Receive mailbox*.
        2. Provide the **User logon name**, we recommend: *mailroundtrip*.
        3. Provide a password. (Note: this password is not used anywhere so any random password will suffice)
        4. Optionally select the OU were you want this account to be created.
        5. Click on **Next** to continue.
    7. Specify mailbox settings:
        1. Optionally select the mailbox database, were you want the mailbox to reside.
        2. Click on **Next** to continue.
    8. Set archive settings:
        1. Select **Don't create an archive**. This mailbox does not contain any email.
        2. Click on **Next** to continue.
    9. Review settings:
        1. Click on **New** to create the new mailbox.
        2. Click on **Finish**.

## Create a return mail contact

Create a mail contact containing the mail round trip return address.

1. Open **Recipient configuration**.
2. Right click on **Mail contact**.
3. Select **New Mail Contact**.
4. Create a new mail contact:
    1. Select **New Contact**.
    2. Click on **Next**.
    3. Provide a **Full name**, we suggest: *Mail Round Trip Monitoring Return Address*.
    4. Enter an alias, we suggest: *mailroundtripreturn*.
    5. Click on the Edit... button:
        1. Enter the following return email address in the E-mail address field: *mailroundtrip@mrt.oversig.ht*.
    6. Click on **Next**:
        1. Review settings.
    7. Click on **New** to create the mail contact:
    8. Verify that the mail contact was created successfully:
        1. Click on **Finish**.

## Modify the return contact

1. Right click on on the previously created mail contact.
2. Select **Properties** from the dropdown menu.
3. Open the **General** tab:
    1. Enable **Hide from exchange address lists**.
4. Click on **OK** to close the dialog.

## Modify the receive mailbox user

Forward all mail to the "Mail Round Trip Monitoring Mailbox" from the previously created "Mail Round Trip Monitoring Return Address" contact.

1. Right click on the previously created receive mailbox user.
2. Select **Properties** from the drop down menu:
    1. Open the **General** tab:
        1. Enable **Hide from exchange address lists**.
    2. Open the **Mail Flow Settings** tab.
    3. Double click on **Delivery Options**:
        1. Select the **Forward to** selection box.
        2. Click on **Browse**:
             1. Select the "Mail Round Trip Monitoring Return Address" contact.
             2. Click on **OK**.
        3. Click on **OK** to close the previous screen.
