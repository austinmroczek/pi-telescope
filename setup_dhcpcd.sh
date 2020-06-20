#!/bin/bash

# configure a static IP
echo "
interface wlan0
    static ip_address=192.168.4.1/24
    nohook wpa_supplicant
" >> /etc/dhcpcd.conf

service dhcpcd restart
