#!/bin/bash

# setup the website

apt --yes install nginx

#mkdir /usr/share/nginx/html/telescope
#echo "<h1>Hello</h1>" > /usr/share/nginx/html/telescope/index.html

#chown pi:www-data -R /usr/share/nginx/html

echo "
server {
	listen 80;
	listen [::]:80;
	server_name _;
	return 301 http://192.168.4.1:8081;
}
" > /etc/nginx/sites-available/telescope.conf

ln -s /etc/nginx/sites-available/telescope.conf /etc/nginx/sites-enabled/telescope.conf
rm /etc/nginx/sites-enabled/default

