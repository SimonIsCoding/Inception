#!/bin/bash

echo "Starting mysql ..."
#service mysql start
mysqld_safe &
sleep 5

echo "creating the DATABASE"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

echo "creating the USER if not exists"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

echo "Granting all privileges on USER"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

echo "giving root permissions to SQL_USER"
mysql -u root -p$SQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

#wordpress and % will have root permissions
mysql -u root -p$SQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${SQL_PASSWORD}';" 
mysql -u root -p$SQL_ROOT_PASSWORD -e "SELECT user, host FROM mysql.user;"

echo "flushing privileges"
mysql -e "FLUSH PRIVILEGES;" -p$SQL_PASSWORD"

echo "shutdowning"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

exec mysqld_safe
#exec tail -f 
