FROM	debian:bullseye

RUN		apt update -y && apt upgrade -y && apt-get install mariadb-server -y

EXPOSE	3306

COPY	conf/50-server.cnf	/etc/mysql/mariadb.conf.d/
RUN		mkdir -p /run/mariadb/ 
COPY	./tools/script.sh /run/mariadb/
RUN		chmod +x /run/mariadb/script.sh

CMD		["/run/mariadb/script.sh"]
#ENTRYPOINT ["bash", "/run/mariadb/script.sh"]
