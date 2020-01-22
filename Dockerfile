FROM debian:buster

# install all services with yes option
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get install -y mariadb-server mariadb-client
RUN apt-get install -y php-cli php-mysql php-curl php-gd php-intl
RUN apt-get install -y php-fpm php-mbstring
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN mkdir /etc/nginx/ssl

# download, extract and install phpMyAdmin, create config
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN mkdir /var/www/phpmyadmin
RUN tar xzf phpMyAdmin-5.0.1-english.tar.gz --strip-components=1 -C /var/www/phpmyadmin
RUN rm phpMyAdmin-5.0.1-english.tar.gz
RUN cp /var/www/phpmyadmin/config.sample.inc.php /var/www/phpmyadmin/config.inc.php

# copy init file file
COPY /srcs/docker_init.sh /usr/local/bin/

# copy all conf files
COPY /srcs/default /etc/nginx/sites-available/
COPY /srcs/ft_server.conf /etc/nginx/sites-available/
COPY /srcs/wordpress.sql /tmp/
COPY /srcs/ssl /etc/nginx/ssl/
COPY /srcs/html/index.html /var/www/

# copy index file change script
COPY /srcs/change_index.sh /etc/nginx/

# executes cmds in the container
ENTRYPOINT ["docker_init.sh"]

# expose ports to outside
EXPOSE 80 443