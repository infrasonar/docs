# Microsoft 365 mail roundtrip

Using contacts is the easiest way to setup the mail roundtrip in Microsoft 365.

It is also possible to use a mailbox instated of a contact for receiving email and setup a forwarding rule on the mailbox.
This requires you however tot [turn off allow external forwarding](https://learn.microsoft.com/en-us/microsoft-365/security/office-365-security/outbound-spam-policies-external-email-forwarding?view=o365-worldwide) which is not a Microsoft best practice.

### Create two contacts

1. Open the [Microsoft 365 admin center](https://admin.microsoft.com)
2. Open the **users** menu and then select **contacts**
3. Click **add contact** to create a mailroundtrip contact for receiving emails
     1. Set Display name to: *mailrountrip-receive*
     2. Set Email to: *mailrountrip-receive@365.test-technolgy.nl*
     3. Enable: *Hide from my organization's global address list*
4. Click **add contact** again to create the mailroundtrip contact forward to account
     1. Set Display name to: *mailrountrip-infrasonar*
     2. Set Email to: *mail@mrt.infrasonar.com*
     3. Enable: *Hide from my organization's global address list*

### Setup rules

1. Open the [Exchange admin center](https://admin.exchange.microsoft.com)
2. Open the **Mail flow** menu and then select **rules**
3. Click the **Add rule** button and select **Create a new rule**
   1. **Name**: InfraSonar mailroundtrip
   2. **Apply this rule if**: *Select **The recipient* and then *is this person*
   3. Select the *mailrountrip-receive* contact you created before
   4. **Do the following**: *Redirect the message to these recipients*
   5. Select the *mailrountrip-infrasonar* contact you created before
   6. Click **Next**
   7. Leave the rule settings
   8. Review and **Finish**
   9. Ensure the rule is **enabled**!