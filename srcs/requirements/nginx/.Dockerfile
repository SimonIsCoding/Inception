FROM	alpine:3.20
#FROM	debian:buster

RUN		apk update && apk add nginx && apk add vim && apk add curl
RUN		mkdir -p /etc/nginx/ssl
RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/nginx.key \
  -out /etc/nginx/ssl/nginx.crt \
  -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=Student/CN=localhost"

#RUN		mkdir -p /etc/nginx/ssl
#RUN		apk add openssl
#RUN		openssl req -x509 -newkey rsa:2048 -keyout /etc/nginx/ssl/key -out /etc/nginx/ssl/cert.pem -days 365 -nodes -subj "/CN=localhost"

#RUN		openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=SP/ST=Barcelona/L=Barcelona/O=42/OU=42/CN=simarcha.42.fr/UID=simarcha" 
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
