mkdir -p /var/www/html/adminer

curl -L "https://www.adminer.org/latest.php" -o /var/www/html/adminer/adminer.php

chown -R www-data:www-data /var/www/html/adminer/adminer.php

chmod 755 /var/www/html/adminer/adminer.php

mkdir -p /run/php/

# Start PHP-FPM
/usr/sbin/php-fpm7.4 -F
