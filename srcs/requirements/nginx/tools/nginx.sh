#! /bin/bash

if [ ! -f /etc/ssl/certs/nginx.cert ]
	openssl req -x509 -nodes -newkey rsa:4096 -days 365 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.cert -subj "/C=ES/ST=Barcelona/L=Barcelona/O=42/OU=Education/CN=eralonso.42.fr"
fi

exec "$@"
