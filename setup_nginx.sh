#!/bin/bash

# setup the nginx web server
# from https://www.shellvoide.com/wifi/how-to-setup-captive-portal-login-with-rogue-ap-nginx/
# ...and https://andrewwippler.com/2016/03/11/wifi-captive-portal/

# install nginx web server
apt --yes install nginx

echo "

server {
        listen 80;
        listen [::]:80;
        server_name _;
        # For IOS
        if ($http_user_agent ~* (CaptiveNetworkSupport) ) {
                return 302 http://192.168.50.10:8081;
        }
        # For everything else
        location / {
                return 302 http://192.168.50.10:8081;
        }
}



" >> /etc/nginx/sites-enabled/telescope.conf