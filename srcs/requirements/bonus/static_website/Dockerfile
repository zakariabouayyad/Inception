FROM debian:bullseye

RUN apt update && apt install nginx -y

COPY ./tools/portfolio.html var/www/html/

EXPOSE 1337

CMD ["nginx", "-g", "daemon off;"]