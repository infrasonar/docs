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

## Maintenance scripts

Three script to ensure carefree maintenance are used.
These scripts are stored in the user home-drive, this is default `/home/pi`

### Morning

Thi script updates the Pi and performs a reboot to ensure a fresh start in the morning

```bash title="/home/pi/morning.bash"
#!/usr/bin/env sh

# A daily upgrade is good hygiene.
sudo apt update && sudo apt full-upgrade -y && sudo apt autoremove -y && sudo apt autoclean

# A daily restart mitigates browser memory leaks, and forces the screen to turn on
sudo reboot now
```
### Boot

This script performs some cleanup actions after a reboot en ensure the dashboard is loaded upon a fresh start.

```bash title="/home/pi/boot.bash"
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

### Evening

This script turns off the display and kills the chrome browser to conserve valuable resources.


```bash title="/home/pi/evening.bash"
#!/usr/bin/env sh

# Shutdown screen, to save the planet
DISPLAY=:0 xset dpms force off

# Don't consume dashboard resources off office hours, to save the planet
pkill chromium
```


### Schedule the scripts

Ensure all three scripts are executable:

```
chmod +x /home/pi/boot.bash 
chmod +x /home/pi/morning.bash 
chmod +x /home/pi/evening.bash 
```


Add the following line at the end of the auto start script `/etc/xdg/lxsession/LXDE-pi/autostart` to ensure the dashboard is loaded upon boot:
```
@/home/pi/boot.bash
```

and remove the following line from this file:
```
@xscreensaver -no-splash
```

Use the following command to ensure executing of the morning and evening script using cron:

```
(crontab -l ; echo "0 7 * * 1-5 /home/pi/morning.bash") | crontab -
(crontab -l ; echo "0 18 * * 1-5 /home/pi/evening.bash") | crontab -
```

If you want to edit the crontab you can do so using `crontab -e`

The website [crontab guru](https://crontab.guru/) can be very helpfull to understand the crontab notation

## Setup the dashboard

last step is to login to infrasonar and configure the dashboard to your liking.

!!! note

    InfraSonar stores its dashboard configuration in local browser storage allowing you to setup multiple different dashboards using one account.


## Enjoy

That's all enjoy your new dashboard!

Don't forget to send us a picture for our wall of dashboards fame!

support+dashboard@infrasonar.com


