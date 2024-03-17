FROM debian:bullseye

RUN apt update && apt install mariadb-server -y

COPY tools/script.sh .

EXPOSE 3306

CMD ["bash", "script.sh"]