FROM debian:11.7

EXPOSE 3306

RUN apt-get update && apt-get install -y \
	mariadb-server

COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN mkdir -p /run/mysqld/ && \
	chown -R mysql:mysql /run/mysqld/ && \
	chmod 777 /run/mysqld/

COPY --chmod=755 tools/mariadb.sh /usr/local/bin/mariadb.sh

RUN mysql_secure_installation

ENTRYPOINT [ "/usr/local/bin/mariadb.sh" ]
