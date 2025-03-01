#!/bin/bash

echo "Starting mysql ..."
#service mysql start
mysqld_safe &
sleep 5

echo "creating the DATABASE"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

echo "creating the USER if not exists"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"

echo "Granting all privileges"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

echo "localhost stuff"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

echo "flushing privileges"
mysql -e "FLUSH PRIVILEGES;"

echo "shutdowning"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown

echo "maybe this line won't be printed"
exec mysqld_safe

#-----------------------------------------------------------------------------o -
#service mariadb start 
#mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
#mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
#mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
#mysql -e "FLUSH PRIVILEGES;"
#mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
#exec mysqld_safe
#-------------------------------------------------------------------------------
#service mysqld start

#service mariadb start 
#echo "CREATE DATABASE IF NOT EXISTS $db1_name ;" > db1.sql
#echo "CREATE USER IF NOT EXISTS '$db1_user'@'%' IDENTIFIED BY '$db1_pwd' ;" >> db1.sql
#echo "GRANT ALL PRIVILEGES ON $db1_name.* TO '$db1_user'@'%' ;" >> db1.sql
#echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '12345' ;" >> db1.sql
#echo "FLUSH PRIVILEGES;" >> db1.sql

#mysql < db1.sql

#kill $(cat /var/run/mysqld/mysqld.pid)

#mysqld
#-------------------------------------------------------------------------------

#service mariadb stop

