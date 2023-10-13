FROM debian:11.7

EXPOSE 9000

RUN apt-get update && apt-get -y install \
	curl \
	mariadb-client \
	php7.3-fpm \
	php7.3-mysqli

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar \
	&& mv wp-cli.phar /usr/local/bin/wp

COPY conf/wordpress_pool.conf /etc/php/7.3/fpm/pool.d/

COPY --chmod=755 tools/wp.sh /usr/local/bin/wp.sh

WORKDIR /var/www/html
