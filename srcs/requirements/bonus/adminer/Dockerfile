FROM debian:bullseye

RUN apt update

RUN apt install -y curl \
	php \
	php-mysql \
	php-fpm

COPY ./tools/script.sh .

CMD [ "bash", "./script.sh" ]
