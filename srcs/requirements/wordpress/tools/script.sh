#!/bin/bash

# Set up WP-CLI
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Download WordPress
cd /var/www/html
wp core download --allow-root
mv wp-config-sample.php wp-config.php

# Configure WordPress
wp config set SERVER_PORT 3306 --allow-root
wp config set DB_NAME $SQL_DATABASE --allow-root --path=/var/www/html
wp config set DB_USER $SQL_USER --allow-root --path=/var/www/html
wp config set DB_PASSWORD $SQL_PASSWORD --allow-root --path=/var/www/html
wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/html


# Install WordPress
wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root --path=/var/www/html
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root --path=/var/www/html

mkdir -p /run/php/

# Start PHP-FPM
/usr/sbin/php-fpm7.4 -F
