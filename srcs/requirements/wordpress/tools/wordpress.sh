#! /bin/bash

if [ ! -f wp-config.php ]; then
	wp core download --allow-root 
	wp config create --dbname=$DATA_BASE_NAME --dbuser=$DATA_BASE_USER --dbpass=$DATA_BASE_PASSWORD --dbhost=$DATA_BASE_HOSTNAME --allow-root
	wp core install --url=$DOMAIN_NAME --title="$WORDPRESS_TITLE" --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL --skip-email --allow-root
	wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --role=author --user-pass=$WORDPRESS_USER_PASS --allow-root
	wp theme install twentytwentytwo --allow-root
fi

/usr/sbin/php-fpm7.3 -F
