#!/bin/bash

sleep 5

# Set up WP-CLI
# Download WP-CLI and make it executable
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# Download WordPress and create wp-config.php
wp core download --allow-root --path=/var/www/html
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# Configure WordPress database settings
# Set the database name, username, password, and host
wp config set SERVER_PORT 3306 --allow-root --path=/var/www/html
wp config set DB_NAME $SQL_DATABASE --allow-root --path=/var/www/html
wp config set DB_USER $SQL_USER --allow-root --path=/var/www/html
wp config set DB_PASSWORD $SQL_PASSWORD --allow-root --path=/var/www/html
wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/html

# Install WordPress
# Set up initial WordPress settings such as URL, title, admin username/password/email
wp core install --url=$DOMAIN_NAME --title=INCEPTION --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path=/var/www/html
# Create an additional user with the 'author' role
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root --path=/var/www/html
# Enable Redis Object Cache
# Install and activate the Redis Object Cache plugin
wp plugin install redis-cache --allow-root --path=/var/www/html/
wp plugin activate redis-cache --allow-root --path=/var/www/html/

# Configure Redis host and port
wp config set WP_REDIS_HOST redis --raw --allow-root --path=/var/www/html
wp config set WP_REDIS_PORT 6379 --raw --allow-root --path=/var/www/html

# Enable Redis Object Cache in WordPress
wp redis enable --allow-root --path=/var/www/html/

# Create directory for PHP-FPM socket file
mkdir -p /run/php/

# Start PHP-FPM
/usr/sbin/php-fpm7.4 -F
