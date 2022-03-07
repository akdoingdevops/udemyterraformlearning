#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
sudo yum -y update
sudo amazon-linux-extras install -y nginx1

# make sure nginx is started
service nginx start
cp /usr/share/nginx/html/index.html /usr/share/nginx/html/index.html.bkp
echo "this is hosted from demo4 of udemy-terrafrom-learning" > /usr/share/nginx/html/index.html