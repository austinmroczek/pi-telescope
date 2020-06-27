#!/bin/bash

# setup the access point
# from https://www.raspberryconnect.com/projects/65-raspberrypi-hotspot-accesspoints/168-raspberry-pi-hotspot-access-point-dhcpcd-method
# ...and https://www.shellvoide.com/wifi/how-to-setup-captive-portal-login-with-rogue-ap-nginx/


apt --yes install dnsmasq

service dnsmasq stop

# configure DHCP server
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig

echo "
#RPiHotspot config - No Internet
interface=wlan0
address=/#/192.168.50.10
dhcp-option=3,192.168.50.10
dhcp-option=6,192.168.50.10
dhcp-range=192.168.50.150,192.168.50.200,255.255.255.0,12h

" > /etc/dnsmasq.conf

service dnsmasq restart

