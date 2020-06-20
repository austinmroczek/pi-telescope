#!/bin/bash

# setup the access point
# from https://www.raspberrypi.org/documentation/configuration/wireless/access-point.md

apt --yes install dnsmasq

service dnsmasq stop

# configure DHCP server
mv /etc/dnsmasq.conf /etc/dnsmasq.conf.orig

echo "
interface=wlan0      # Use the required wireless interface - usually wlan0
listen-address=192.168.4.1
no-hosts
dhcp-range=192.168.4.2,192.168.4.20,255.255.255.0,24h
dhcp-option=option:router,192.168.4.1
dhcp-authoritative

address=/*/192.168.4.1
no-resolv
log-queries
bind-interfaces
" > /etc/dnsmasq.conf

service dnsmasq restart

