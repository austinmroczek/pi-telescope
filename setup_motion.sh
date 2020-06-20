#!/bin/bash

# setup the camera first
# from https://www.instructables.com/id/How-to-Make-Raspberry-Pi-Webcam-Server-and-Stream-/

# install motion
apt --yes install motion

# ignoring the part about ensuring the camera is visible because I know mine is....
# you should do 'lsusb' and make sure you can see the camera

# make sure the motion.conf file is set up correctly
sed -n 'H;${x;s/daemon off/daemon on/;p;}' /etc/motion/motion.conf > tmp_motion
sed -n 'H;${x;s/stream_localhost on/stream_localhost off/;p;}' tmp_motion > tmp_motion1
sed -n 'H;${x;s/post_capture 0/post_capture 5/;p;}' tmp_motion1 > tmp_motion2
cat tmp_motion2 > /etc/motion/motion.conf
rm tmp_motion tmp_motion1 tmp_motion2

# set daemon to start by default
echo start_motion_daemon=yes > /etc/default/motion

# start the motion daemon
service motion restart
