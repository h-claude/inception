FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install -y mariadb-server

COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY /conf/script_conf.sh /tmp/script_conf.sh

RUN chmod +x /tmp/script_conf.sh

EXPOSE 3306

CMD ["./tmp/script_conf.sh"]