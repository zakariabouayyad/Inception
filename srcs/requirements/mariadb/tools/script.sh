service mariadb start

sleep 2

# Create a new database if it doesn't exist
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Create a new user with specified password
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Grant all privileges on the database to the new user
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# Alter the password for the MySQL 'root' user when accessing from 'localhost'
# The ${SQL_ROOT_PASSWORD} is the placeholder that gets substituted with the actual password value
mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# Restart MySQL service for the changes to take effect
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# Start the MySQL server in safe mode, binding to all network interfaces and using port 3306
mysqld_safe --bind 0.0.0.0 --port 3306
