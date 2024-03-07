FROM debian:bullseye

WORKDIR /var/www/html

RUN apt update && apt upgrade -y

RUN apt install wget -y

RUN wget https://wordpress.org/latest.tar.gz

RUN tar -xzvf latest.tar.gz

RUN cp /var/www/html/wordpress/wp-config-sample.php /var/www/html/wordpress/wp-config.php

EXPOSE 9000