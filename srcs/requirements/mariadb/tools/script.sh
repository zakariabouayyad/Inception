# create our table!
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# creating a user who can manipulate the table
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

# give all rights to the user
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

# chi hmaq ->> altering the password for the MySQL user 'root' when accessing from 'localhost', The ${SQL_ROOT_PASSWORD} is likely a placeholder that gets substituted with the actual password value from some external source or environment variable.
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

# refresh all of this so that MySQL takes it into account.
mysql -e "FLUSH PRIVILEGES;"

# restart MySQL for all this to take effect
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

# start the MySQL server
exec mysqld_safe