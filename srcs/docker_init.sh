#!/bin/bash

# All commands executed in container
rm /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/ft_server.conf /etc/nginx/sites-enabled/
service mysql start
service php7.3-fpm start
service nginx start
mysql -u root < /tmp/wordpress.sql
rm /tmp/wordpress.sql
# chown -R www-data:www-data /var/www/*
# chmod -R 755 /var/www/*
mysqlshow
/bin/bash