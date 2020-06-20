#!/bin/bash

# setup the access point
# from https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md

apt --yes install hostapd

service hostapd stop

# configure access point

echo "
interface=wlan0
driver=nl80211
ssid=pi_telescope
hw_mode=g
channel=7
wmm_enabled=0
macaddr_acl=0
auth_algs=1
ignore_broadcast_ssid=0
" > /etc/hostapd/hostapd.conf

mv /etc/default/hostapd /etc/default/hostapd.dist
echo DAEMON_CONF="/etc/hostapd/hostapd.conf" > /etc/default/hostapd

# start it up
systemctl unmask hostapd
systemctl enable hostapd
systemctl start hostapd
