#!/bin/bash


service nginx start

service php7.4-fpm start

tail -f /var/log/nginx/host.access.log