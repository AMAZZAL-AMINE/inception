FROM debian:latest

ARG PHP_VERSION=8.3.7 \
DB_NAME \
DB_USER \
DB_PASSWORD
RUN apt-get update -y && apt-get upgrade

RUN  apt-get install  -y curl
    # php${PHP_VERSION} \
    # php${PHP_VERSION}-fpm \
    # php${PHP_VERSION}-mysqli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --path=/var/www --allow-root