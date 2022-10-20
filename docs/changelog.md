## 0.2.12

<small>_ Wednesday 03 Aug 2022 @ 22:00 CET</small>

* Minor Enodo updates.

## 0.2.11

<small>_ Monday 01 Aug 2022 @ 21:00 CET</small>

* Added Enodo.
* No more Guest probes.

## 0.2.10

<small>_ Friday 15 Jul 2022 @ 13:00 CET</small>

* Improved DNS probe dialog.
* Removed Lift, SQL SSH, VmwareGuest, WinRm and XenGuest probes.
* Added feedback for failed reports.
* Fixed adding a user with same email address but different auth provider.
* Fixed a few spelling mistakes.
* Added TcpProbe.
* Added WMI Check for files option using the `cimDatafiles` class.
* Added _services-name_ to the windows services widget.

## 0.2.9

<small>_ Tuesday 17 May 2022 @ 17:00 CET</small>

* Fix saving the order of metrics in a grid.
* Changed caption column to description in application widget.

## 0.2.8

<small>_ Monday 16 May 2022 @ 21:00 CET</small>

* Added `allowRedirects` option to the http probe configuration.
* Added `docker` icon.
* Removed `text` widget.
* Added Azure probe.
* Allow `agents` to be added in InfraSonar.
* Fix display `probe` address.
* Fix filter for assigned alerts.
* Fix displaying the correct metrics in a widget.
* Fix application widget by using _description_ field instead of _caption_.
* Fix closing a legend when moving mouse focus out the widget.
* No longer close a widget edit dialog when clicking outside the editor.

## 0.2.7

<small>_ Tuesday 11 Apr 2022 @ 21:00 CET</small>

* Upgraded packages.
* Fixed broken widget when switching between hosts.
* Enable search on host-name in alerts and closed-alerts page.
* Added *pingProbe* and removed *psProbe*.
* Added *httpProbe*.
* Added *nmapProbe* (v2.x.x).
* Fixed broken check interval select box.
* Fixed broken boolean probe switch.
* Added probe configuration checks on asset edit.
* Fixed broken filter component for `True` values in data table.
* Re-direct to the requested link after sign-in.
* Fixed typo in subscriptions.
* Fixed overlay bug on drop-down-arrows in *"edit widget"* dialog.
* Fixed bug with *"Add widget"* button when a asset has no label.
* Changed the no-environment page for new users and added copyright text.
* Changed the link to *"Contact support"*.
* Fixed bug with resetting the check interval.
* No longer allow to change dialog tabs while providing a reason for change.
* Remove missing network probe warning message as this is no longer a best practice.

## 0.2.6

<small>_ Thursday 17 Feb 2022 @ 21:00 CET</small>

* Fixed CSV download for InfraSonar Accounts (sysadmin).
* Add *"show more"* when more text-lines are available in logging message.
* Fixed missing email address at the *no-environments* page.
* Changed menu behavior at probe page *(solves highlight last item)*.
* Added icon for Pure Storage.
* Prevent view changes of probe page on refresh.

## 0.2.5

<small>_ Tuesday 01 Feb 2022 @ 21:30 CET</small>

* Fixed bug with incognito browsing.

## 0.2.4

<small>_ Tuesday 01 Feb 2022 @ 20:00 CET</small>

* Fixed bug in filter host specific closed alerts.
* Changed ordering on first click in a grid.
* Fixed bug in host filter on alerts page (not showing the name of the host).
* Switched to FireBase authentication.
* Added support for Microsoft Azure (work) accounts.
* Switched to NPM 8.x for website building.

## 0.2.3

<small>_ Wednesday 12 Jan 2022 @ 22:00 CET</small>

* Fixed bug with filter selection (not visible) in grid.
* Fixed bug with user container view when having no users.
* Fixed minor widget editor bugs.
* Changed filter and sort icon appearance to make active filter or order visible.

## 0.2.2

<small>_ Friday 24 Dec 2021 @ 20:00 CET</small>

* Fixed column sorting on container view.
* Fixed filter outline with little space to render the filter selection.
* Fixed missing condition options in expression builder.
* Added *Last seen* column to host overview as alternative to the *Active* column.

## 0.2.1

<small>_ Wednesday 22 Dec 2021 @ 20:00 CET</small>

* Added environment to *Breadcrumbs* bar when the name equals the parent container.
* Fixed access check for modifying **Views** and return with an appropriate message if not.
* Fixed spacing between name and body in an alert message.
* Removed incorrect icon in front of *Agent-core* in host overview.

## 0.2.0

<small>_ Tuesday 21 Dec 2021 @ 20:00 CET</small>

* Updated UI using the Material design language.
* Added Light/Dark mode.
* Added a dashboard which shows useful information and shortcuts.
* Added the **Tasks** overview. In this overview, Admins can see all tasks related to the current environment.
* The **Closed** alerts and the **Search** closed alerts pages are merged into a single page.
* Added the option to "star" *Views* and *Environments* as favorite.
* Added a "Share" button to *Views*.
* Added "click-on-tag" for "copy-to-clipboard".
* Merged the *container* and *environment* logging into one page.
* Added a "Task" column and a "Parent" column to log entries.
* Replaced the counter with tags in the **Conditions** page.
* Authentication provider is now implied when adding a user to a container.
* Improved feedback when submitting invalid forms.
* Added specific icons to all *Hosts*.
* Added "No environments found" screen, for users without container access.
* Added time selection to the statistics page.
* Added the "Windows Services" widget to the **Insight** page.

## 0.1.109

<small>_ Tuesday 07 Dec 2021 @ 20:00 CET</small>

* Fixed API checks.

## 0.1.108

<small>_ Monday 29 Nov 2021 @ 20:00 CET</small>

* Enable `changed` option for boolean and timestamp type.
* Removed CRM from InfraSonar.

## 0.1.107

<small>_ Saturday 13 Nov 2021 @ 14:00 CET</small>

* Critical update: `aiogcd`.

## 0.1.106

<small>_ Friday 12 Nov 2021 @ 20:00 CET</small>

* Collapsible raster on double mouse click.
* Added audit logging to re-discover changes on a host.
* Fixed bug with selecting a time range within a modal.
* Fixed socket message on re-connect.
* Added search in my alerts view.
* Prevent inserting invalid metric info.

## 0.1.105

<small>_ Tuesday 12 Oct 2021 @ 20:00 CET</small>

* Log tasks using the user who initiated the task.
* Return the taskId when creating a task using the API.
* Send an email to the user when a schedules task has failed.

## 0.1.104

<small>_ Monday 13 Sep 2021 @ 20:00 CET</small>

* Added Id column to environment overview page.
* Added /api/environments API call.
* Added support for custom time zone per environment.
* Fixed bug with assigned alerts for users without key string.

## 0.1.103

<small>_ Tuesday 27 Jul 2021 @ 11:00 CET</small>

* Loosely name validation for check and type in data query API call.

## 0.1.102

<small>_ Wednesday 21 Jul 2021 @ 22:00 CET</small>

* Added `environment` and `lastSeen` columns to `api/hosts` API call.
* Added `api/labels` API call to query for labels in an environment.
* Fixed bug in widget editor when no hosts are configured.
* Fixed minor widget bugs (no panel data, handle escape key correctly).

## 0.1.101

<small>_ Thursday 15 Jul 2021 @ 20:00 CET</small>

* Added check for valid labels in API call `api/host/label/add`.
* Added filter for empty hosts in view.
* Added filter item option in widgets.
* Added the option to exclude host with specified labels from a view.
* Auto convert `int` to `float` for the insert API call.
* Fixed bug in auto refresh on a view.
* Fixed bug in validate API metric names.
* Fixed bug when moving a root widget on a host overview page.
* Fixed minor bug in side menu on probe pages.
* Required metrics no longer accept a `null` value.

## 0.1.100

<small>_ Tuesday 22 Jun 2021 @ 20:00 CET</small>

* Added link to new InfraSonar documentation.
* Added query data API call and added `/api/data` to replace `api/data/insert`.
* Added support for `withLabel` and `withProbe` keys to hosts query API.
* Replaced `accept`/`reject` lists with `item (not) in list`.
* Check for int64 when using the API to insert data.
* Improved error messages when using incorrect API calls.
* Fixed double boolean naming when choosing a display function.

## 0.1.99

<small>_ Tuesday 18 Apr 2021 @ 9:00 CET</small>

* Fix alerts overview.

## 0.1.98

<small>_ Monday 17 May 2021 @ 20:00 CET</small>

* Added tool for generating encryption keys.
* Fix ConnectWise member API call.
* Fix My-Alert view (too many alerts).
* Fix time range selection on aggregation grid.
* Sort series on environment in time-series chart.
* Update: ThingsDB client (fix re-connect Emitter bug).
* Update: Python packages.
* Update: Npm packages.

## 0.1.97

<small>_ Tuesday 20 Apr 2021 @ 12:00 CET</small>

* Fix alerts.

## 0.1.96

<small>_ Monday 19 Apr 2021 @ 19:45 CET</small>

* Fix charts.

## 0.1.95

<small>_ Monday 19 Apr 2021 @ 19:00 CET</small>

* Improved item-list in expression editor.
* Fixed number of rows in grid after using a filter (search).
* Update browser title when opening a view.
* Fixed CTRL-F when viewing a data-table with search disabled.
* Added column suppressed label count on conditions page.
* Fixed bug with auto-refresh.
* Update: Python packages.
* Update: Npm packages.

## 0.1.94

<small>_ Wednesday 7 Apr 2021 @ 15:30 CET</small>

* Fixed ConnectWise manage bug, maximum summary length.

## 0.1.93

<small>_ Tuesday 6 Apr 2021 @ 20:00 CET</small>

* Added API route for posting InfraSonar (host) data.
* Added API routes for controlling metadata.
* Added derived metric option.

## 0.1.92

<small>_ Monday 15 Mar 2021 @ 20:00 CET</small>

* Fixed check for valid hostUuids in API handler.
* Select current user as default owner for an alert.

## 0.1.91

<small>_ Wednesday 24 Feb 2021 @ 20:00 CET</small>

* Allow ticket in CWM without owner.
* Update API documentation.

## 0.1.90

<small>_ Tuesday 23 Feb 2021 @ 20:00 CET</small>

* Added ConnectWise Manage support.
* Added environment widget for installed software on Windows.
* Added option to select a time range for the aggregation grid widget.
* Fixed bug in top menu after window resize.

## 0.1.89

<small>_ Thursday 14 Jan 2021 @ 20:00 CET</small>

* Added channels column on labels overview page.
* Added item (not) in list expression to replace black/white list.
* Added option to accept or reject specific conditions for DutyCalls.
* Added option to show/hide self signed certificates.
* Added option to sort on environemt in a gid widget.
* Added search box to certificate widget.
* Auto-complete default probe address unless changed by the user.
* Changed export to CSV for time and age values.
* Prevent saving conditions with empty expressions.
