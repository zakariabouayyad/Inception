FROM debian:bullseye

RUN apt update && apt upgrade -y

RUN apt install -y mariadb-server

WORKDIR /mydir

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY . .

CMD chmod +x ./tools/script.sh && ./tools/script.sh