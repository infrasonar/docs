# Microsoft Windows

## Microsoft Windows services

This section describes an unusual condition.

We check if Microsoft Windows services which are set to **autostart** are actually **running**.

While this seems a logical approach the truth is there are services that are set to autostart that stop soon after starting.

The list below outlines these exceptions:

Service                                                  | Name                              | description
---------------------------------------------------------|-----------------------------------|----------------------------------------------------
Adobe Acrobat Update Service                             | AdobeARMservice                   |
AMF Scan en Herken Service                               | AMFScanHerkenService              |
Background Intelligent Transfer Service                  | BITS                              |
Benutzerdienst für die Plattform für verbundene Geräte_* | CDPUserSvc_*                      | This service uses an ID, we suppress them all.
Citrix vDisk Update Service                              | Citrix.Xip.ClientService          |
Connected Devices Platform Service                       | CDPSvc                            |
Cortex XDR Health Helper                                 | xdrhealth                         |
Downloaded Maps Manager                                  | MapsBroker                        |
Edge update service                                      | edgeupdate                        |
Google update service                                    | gupdate                           |
Group Policy Client                                      | gpsvc                             |
Intel(R) TPM Provisioning Service                        | Intel(R) TPM Provisioning Service |
M-Files de-installatie-assistent                         | MFUninst*                         | We suppress all versions
Microsoft .NET Framework...                              | clr_optimization_...              | We suppress all versions
Microsoft Exchange Compliance Audit                      | MSComplianceAudit                 |
Microsoft Exchange DAG Management                        | MSExchangeDagMgmt                 |
Microsoft Exchange Notifications Broker                  | MSExchangeNotificationsBroker     |
Mouse without Borders Service                            | MouseWithoutBordersSvc            |
Multimedia Class Scheduler                               | MMCSS                             |
Performance Logs and Alerts                              | SysmonLog                         |
Remote Registry                                          | RemoteRegistry                    |
Virtual Disk                                             | vds                               |
Windows Audio                                            | AudioSrv                          |
Windows Biometric Service                                | WbioSrvc                          |
Windows Image Acquisition (WIA)                          | stisvc                            |
Windows Modules Installer                                | TrustedInstaller                  |
Windows Update                                           | wuauserv                          |
ScanMail EUQ Monitor                                     | EUQ_Monitor                       |
Service Fabric Installer Service                         | FabricInstallerSvc                |
Shell Hardware Detection                                 | ShellHWDetection                  |
Smart Card                                               | SCardSvr                          |
Software Protection                                      | sppsvc                            |
Sophos Clean                                             | Sophos Clean Service              |
Sophos Patch Endpoint Communicator                       | SophosPatchEndpointCommunicator   |
Sophos Patch Endpoint Orchestrator                       | SophosPatchOrchestratorService    |
Sophos Patch Server Communicator                         | SophosPatchServerCommunicator     |
Sophos Safestore                                         | Sophos Safestore Service          | [source](https://support.sophos.com/support/s/article/KB-000043550?language=en_US)
Sophos update service                                    | swi_update                        |
Sophos update service                                    | swi_update_64                     |
Symantec Endpoint Protection Hardening CAF Service       | heCAF                             |
Sync Host_*                                              | OneSyncSvc_*                      | Sync Host has a unique ID as part of the service name `*`
Tile Data model server                                   | tiledatamodelsvc                  |
TPM Base Services                                        | TBS                               |
Traps Watchdog                                           | panwd                             |
Traps Watchdog Service                                   | twdservice                        |
