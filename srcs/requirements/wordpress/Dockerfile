FROM debian:bookworm

ARG PHP_VERSION=8.2 \
DB_NAME \
DB_USER \
DB_PASSWORD

RUN apt-get update -y && apt-get upgrade \
    && apt-get install  -y curl \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysqli \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
    && wp core download --path=/var/www --allow-root

WORKDIR /var/www

CMD ["php-fpm${PHP_VERSION}", "-F"]