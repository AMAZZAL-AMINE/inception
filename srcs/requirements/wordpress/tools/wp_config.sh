#!/bin/bash

wp config create --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}" --path=/var/www --allow-root --skip-check --dbhost=mariadb

# admin
wp user create "${WP_USER}" "${WP_USER_EMAIL}" --role=administrator --user_pass="${WP_USER_PASSWORD}" --path=/var/www --allow-root --skip-email

wp user create "${WP_USER2}" "${WP_USER_EMAIL2}" --role=administrator --user_pass="${WP_USER_PASSWORD2}" --path=/var/www --allow-root --skip-email

exec "$@"