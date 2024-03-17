FROM debian:bullseye

RUN apt-get update -y

RUN apt-get install -y nginx openssl

# Create a self-signed SSL certificate
RUN mkdir -p /etc/nginx/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"

# Copy NGINX configuration file
COPY conf/default /etc/nginx/sites-available/default

RUN mkdir -p /run/nginx

# Expose port 443 for HTTPS
EXPOSE 443

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]