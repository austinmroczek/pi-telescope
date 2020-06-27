# pi-telescope
My Raspberry Pi enabled telescope.

What it does now:
- Sets up the webcam software
- Streams to port 8081 on the Raspberry Pi

What more I want it to do:
- Optimally configure camera for astronomy
- Act as wifi access point so phones/tablets can easily use it
- Automatically direct new wifi clients to the camera stream
- Control Telescope motors
- Lots of other fancy astronomy stuff

Tested with Raspbian Buster

Hardware
- Telescope: Celestron NexStar 80GTL (model # 22085)
- Astronomy camera: SV105 from SVBONY
- Raspberry Pi 3

# Download the files
Log in as the `pi` account

`cd ~` ensures you are in the home directory

`git clone https://github.com/austinmroczek/pi-telescope.git` 

`cd pi-telescope`

# Camera setup

Install the `motion` software and set up the daemon to run automatically.  Read the script for details.

`sudo setup_motion.sh`

Open a browser to the IP address of the Raspberry Pi

`http://192.168.1.xyz:8081/`

If you don't know your IP address do `ifconfig` and look for the "inet" for "eth0" (the ethernet jack)

`crontab -e`

Add the following line at the end

`@reboot  /home/user/test.sh`


# Wifi Access Point setup
Note:  the directions here set up a wifi access point with no access to the internet and no password.  __Use at your own risk, and don't leave it connected when not in use.__    

`sudo setup_hostapd.sh`

You should now see a wifi access point called "telescope".  Now set up DHCP so users get an IP address.  

`sudo setup_dnsmasq.sh`

You should now be able to connect to the "telescope" access point and your device should automatically get an IP address.

Ensure interfaces are correctly set up

`sudo setup_interfaces.sh`

# Setup Captive Portal
This part will send users to the webcam address.

`sudo setup_nginx.sh`


# Updating
If this code has updated, from the `pi-telescope` directory do 

`git pull`


# References
- Webcam setup: https://www.instructables.com/id/How-to-Make-Raspberry-Pi-Webcam-Server-and-Stream-/
- Webcam vs Camera:  https://www.element14.com/community/thread/71206/l/why-vcgencmd-getcamera-always-get-supported1-detected0?displayFullThread=true
- Access Point setup: https://www.raspberryconnect.com/projects/65-raspberrypi-hotspot-accesspoints/168-raspberry-pi-hotspot-access-point-dhcpcd-method
- Captive Portal setup: https://www.shellvoide.com/wifi/how-to-setup-captive-portal-login-with-rogue-ap-nginx/
- Telescope details: https://www.nexstarsite.com


https://andrewmichaelsmith.com/2013/08/raspberry-pi-wi-fi-honeypot/
http://www.cybersecurityguy.com/Building_a_Raspberry_Pi_Captive_Portal_Wi-Fi_Hotspot.pdf

https://bjornjohansen.no/redirect-to-https-with-nginx
