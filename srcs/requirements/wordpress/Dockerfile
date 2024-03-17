FROM debian:bullseye

RUN apt-get update && apt install -y curl

RUN apt install -y php php-mysql php-fpm php-redis

RUN apt install -y sendmail

# Configure PHP-FPM to listen on port 9000 instead of using a Unix socket
RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 9000#' /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/script.sh .

CMD ["bash" , "./script.sh"]
