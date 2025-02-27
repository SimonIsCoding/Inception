FROM	alpine:3.20
#FROM	debian:buster

RUN		apk update && apk add nginx && apk add vim && apk add curl
RUN		mkdir -p /etc/nginx/ssl
RUN		apk add openssl
RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=SP/ST=Barcelona/L=Barcelona/O=42/OU=42/CN=simarcha.42.fr/UID=simarcha" 
RUN		apk add --no-cache shadow
#name www-data is an UNIX convention to define the user and the group to execute the web server
RUN		adduser -S www-data -G www-data
RUN		mkdir -p /var/run/nginx
RUN		mkdir -p /var/www/html
RUN		chmod 755 /var/www/html
RUN		chown -R www-data:www-data /var/www/html

#COPY	./index.html /usr/share/nginx/html/index.thml
COPY	./conf/nginx.conf /etc/nginx/nginx.conf

#Server port
#EXPOSE	80

#Turn nginx on
#try with the command ENTRYPOINT to see thee behavior 
CMD	["nginx", "-g", "daemon off;"]
