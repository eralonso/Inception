#! /bin/bash

service mysql start

if [ ! -f /var/lib/mysql/$DATA_BASE_NAME ]; then
	mysql -u $MARIADB_ROOT_USER -p $MARIADB_ROOT_PASSWORD -e "CREATE DATABASE $DATA_BASE_NAME;"
fi

