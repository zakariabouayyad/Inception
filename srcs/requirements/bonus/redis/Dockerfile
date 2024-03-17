FROM debian:bullseye

RUN apt update && apt install redis -y

EXPOSE 6379

# Start Redis server
CMD ["redis-server", "--protected-mode", "no"]

# CMD ["redis-server", "--protected-mode", "no"]: This sets the command to run when the container starts. It starts the Redis server (redis-server) with the --protected-mode no flag, which disables protected mode, allowing Redis to accept connections from clients outside of localhost.