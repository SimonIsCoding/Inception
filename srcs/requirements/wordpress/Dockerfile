FROM	alpine:3.20

RUN	echo "https://dl-cdn.alpinelinux.org/alpine/v3.20/community" >> /etc/apk/repositories && apk update

RUN	apk add --no-cache curl

RUN	apk update && apk add --no-cache \
	php \
	php-fpm \
	php-mysqli \
	php-json \
	php-opcache \
	php-gd \
	php-mbstring \
	php-curl \
	php-xml \
	php-tokenizer \
	php-common

WORKDIR	/var/www/html

RUN	curl -O https://wordpress.org/latest.tar.gz && \
	tar -xzf latest.tar.gz --strip-components=1 && \
	rm latest.tar.gz

EXPOSE	80
CMD	["php-fpm", "-F"]
