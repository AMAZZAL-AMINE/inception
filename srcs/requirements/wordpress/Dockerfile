FROM debian:bookworm

ENV PHP_VERSION=8.2 \
DB_NAME="wprdpress" \
DB_USER="wordpress" \
DB_PASSWORD="wordpress"

RUN apt-get update -y && apt-get upgrade \
    && apt-get install  -y curl \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
    && wp core download --path=/var/www --allow-root \
    && sed -i "s|listen = /run/php/php8.2-fpm.sock|listen = 0.0.0.0:9000|g" /etc/php/8.2/fpm/pool.d/www.conf

WORKDIR /var/www/
# create wp config file (wp-config.php) 1
# set up wp admin user 2

COPY ./tools/wp_config.sh /var/www/

RUN chmod 777 /var/www/wp_config.sh

ENTRYPOINT ["sh", "/var/www/wp_config.sh"]

CMD ["php-fpm8.2", "-F"]