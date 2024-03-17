FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd

# RUN mkdir -p /etc/vsftpd/empty
# RUN mkdir -p /var/run/vsftpd

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/ftp.sh .

CMD ["bash", "ftp.sh"]
