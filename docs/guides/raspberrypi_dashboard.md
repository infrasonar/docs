![raspberry logo](../images/guides_raspberry.png){ width="150" align=right}

# Raspberry PI Dashboard

This guide describes how we have setup some Raspberry Pi 3's at Cesbit HQ for our digital dashboards. [^1]

[^1]: Based upon the excellent work done by [unito](https://unito.io/blog/better-raspberry-pi-dashboards/)

## Intall Rspbian desktop edition

Install [Raspbian](https://www.raspberrypi.org/downloads/raspbian/)
Download the “desktop” edition, this more then sufficient for  our needs.

Once your Raspberry Pi has started open the Raspberry Pi Configuration. (*Menu → Preferences → Raspberry Pi Configuration*)

## Basic configuration

1. Set your *hostname* in the **system** tab
2. Enable *VNC* in the **interfaces** tab
3. Optional: configure WLAN access

## Software installation

```
sudo apt update && \
sudo apt remove -y apt-listchanges && \
sudo apt full-upgrade -y && \
sudo apt install -y fonts-noto-color-emoji xdotool && \
sudo apt autoremove -y && \
sudo apt autoclean
```

## Startup

This startup script performs some cleanup actions after a reboot en ensure the dashboard is loaded upon a fresh start.

```bash title="/home/pi/autostart.sh"
#!/usr/bin/env sh

# Disable screensaver. Varies across Pi models & Raspbian versions; might be outdated.
# Google "raspberry disable suspend screensaver" for help

xset s off
xset -dpms
xset s noblank

# Move the mouse cursor out of the way!
xdotool mousemove 0 0

# Avoid "Chrome didn't shutdown correctly" notification on unclean shutdown
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/'Local State'
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/; s/"exit_type":"[^"]\+"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences

# Start Chromium, in fullscreen "kiosk" mode, and disabling update notifications
chromium-browser --kiosk --check-for-update-interval=31536000 'https://app.infrasonar.com/dashboard'
```

Ensure the startup script is executable:

```bash
chmod +x /home/pi/autostart.sh 
```

Create the file `/home/pi/config/autostart/infrasonardashboard.desktop` with the following content:

```
[Desktop Entry]
Name=InfraSonar Dashboard
Exec=sh /home/pi/autostart.sh
Terminal=false
Type=Application
```

Ensure this file is executable:

```bash
chmod +x /home/pi/config/autostart/infrasonardashboard.desktop 
```

## Setup the dashboard

last step is to login to infrasonar and configure the dashboard to your liking.

!!! note

    InfraSonar stores its dashboard configuration in local browser storage allowing you to setup multiple different dashboards using one account.


## Enjoy

That's all enjoy your new dashboard!

Don't forget to send us a picture for our wall of dashboards fame!

support+dashboard@infrasonar.com


