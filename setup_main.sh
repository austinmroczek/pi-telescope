#!/bin/bash

# camera / motion
./setup_motion.sh

# web access to camera
./setup_web.sh

# set own IP as static
./setup_dhcpcd.sh

# setup DNS
./setup_dnsmasq.sh

# setup access point
./setup_hostapd.sh

