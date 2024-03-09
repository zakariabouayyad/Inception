FROM debian:bullseye

RUN apt-get update && apt install -y curl

RUN apt install -y php

RUN apt install -y php-mysql

RUN apt install -y php-fpm

# RUN apt install -y mariadb-client

RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/script.sh .

CMD ["bash" , "./script.sh"]
