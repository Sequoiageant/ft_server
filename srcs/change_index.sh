#!/bin/bash
file="/etc/nginx/sites-enabled/default"
if [ -h "$file" ]
then
	rm $file \
	&& echo "default index removed." \
	&& service nginx restart

else
	ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/ \
	&& echo "default index restored." \
	&& service nginx restart
fi