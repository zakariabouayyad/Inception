FROM debian:bullseye

RUN apt update

RUN apt install wget -y

RUN wget https://github.com/google/cadvisor/releases/download/v0.49.1/cadvisor-v0.49.1-linux-amd64 \
	-O cadvisor && chmod +x cadvisor

CMD [ "./cadvisor" ]
