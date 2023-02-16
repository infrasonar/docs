
# E-Series

## How to configure SNMP monitoring on E-Series
​
### Applies to

* Flash Array
* E-Series Controller Firmware 7.xx
* E-Series Controller Firmware 6.xx

### Description

Simple Network Management Protocol (SNMP) is used for remote status monitoring of servers, network appliances, and software processes. SNMP is designed for an IT administrator to monitor the active technology assets, which are required to perform the business' day to day activities. SANtricity provides a portal for IT administrators to remote monitor their storage array. This article describes the procedure to configure SNMP.

### Procedure
Perform the following steps to configure SNMP in SANtricity:  

1. Open the Enterprise Management window of SANtricity and select the array that you would like to configure for SNMP.
2. Right-click on the Array and select Configure Alerts.<br>
   A new window opens. Click the SNMP tab at the top:<br>
   An IT Administrator can configure SNMP for this storage array.<br>
   Since SANtricity is software based and it relays the active status' of the storage array, there is only one option for configuring SNMP and it is by sending traps.<br>
   SNMP requires two data points for sending traps, a *Community Name* and the *Trap destination*. The Community Name, also known as the *community string* should match the SNMP configured Community Name (string). The Trap Destination will be the IP address or host name of the SNMP server or relay.
3. To obtain the MIB (Management Information Base) file for use in a third party SNMP server, perform the following steps:
    1. Go to the NetApp Support Software download page.
    2. Locate E-Series/EF-Series SANtricity Storage Manager and click Go!
    3. Click View & Download on the latest version of SANtricity software.
    4. Click Continue at the bottom of the page.
    5. Read the EULA and click Accept.
    6. Scroll down to the MIB File section.
    7. Click the download link for the .MIB file labeled MIB file for SNMP traps.

Note: For further info please see the Alert Notification Using Email to SNMP Traps section located in the [Initial Configuration and Software Installation for SANtricity® Storage Manager](https://library.netapp.com/ecm/ecm_get_file/ECMP1394572) document.

If you have any issues or concerns with configuring SNMP within SANtricity, contact NetApp Support. 