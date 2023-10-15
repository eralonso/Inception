#! /bin/bash

service mysql start

if [ ! -d /var/lib/mysql/$DATA_BASE_NAME ]; then
	mysql -u $MARIADB_ROOT_USER -p$MARIADB_ROOT_PASSWORD -e "CREATE DATABASE $DATA_BASE_NAME;"
	mysql -e "CREATE USER '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD';"
	mysql -e "GRANT ALL ON $DATA_BASE_NAME.* TO '$MARIADB_USER'@'%' IDENTIFIED BY '$MARIADB_USER_PASSWORD' WITH GRANT OPTION;"
	mysql -e "FLUSH PRIVILEGES;"
fi

mysqladmin -u $MARIADB_ROOT_USER --password=$MARIADB_ROOT_PASSWORD shutdown

mysqld
