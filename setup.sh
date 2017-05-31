#!/bin/bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

#install Docker
curl -sSL https://get.docker.com/ | sh

#install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.13.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose

#make docker-compose executable
sudo chmod +x /usr/local/bin/docker-compose

#enable ssh, block others
ufw disallow incoming
ufw allow ssh
enable ufw

#get nginx
apt-get update && apt-get install nginx -y

#allow nginx through ufw
ufw allow 'Nginx HTTPS'

#create symlink for lively server config
rm -v /etc/nginx/sites-enabled/default
ln -s ./script_files/lively /etc/nginx/sites-enabled/lively

#restart nginx
nginx -s reload
