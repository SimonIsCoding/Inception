FROM	debian:bullseye	

EXPOSE	9000

RUN		apt-get update -y && apt-get upgrade -y && apt-get -y install wget
RUN		apt-get install php7.4-fpm php7.4-cli php7.4-mysql -y

RUN 	mkdir -p /run/php && chown www-data:www-data /run/php && chmod 755 /run/php
RUN		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www
RUN		cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz
RUN		chown -R root:root /var/www/wordpress
#COPY	custom-php.ini /usr/local/etc/php/conf.d/
#COPY	custom-php-fpm.conf /usr/local/etc/php-fpm.d/
RUN		wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		chmod +x wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp
RUN		wp core download --path=/var/www/html --allow-root
RUN		apt install vim -y
RUN		apt update && apt install -y iputils-ping
RUN		apt-get update && apt-get install mariadb-client -y
RUN		mkdir -p /var/www/html && echo "define('DB_NAME', 'wordpress'); \n\
define('DB_USER', 'root'); \n\
define('DB_PASSWORD', 'admin'); \n\
define('DB_HOST', 'mariadb'); \n\
require_once(ABSPATH . 'wp-settings.php');" > /var/www/html/wp-config.php
RUN		apt install -y default-mysql-client

ENTRYPOINT ["php-fpm7.4", "--nodaemonize"]
#CMD		["php-fpm", "--nodaemonize"]
