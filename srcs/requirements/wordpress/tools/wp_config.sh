#!/bin/bash

echo "DB-NAME: ${DB_NAME}"
echo "DB-USER: ${DB_USER}"
echo "DB-PASSWORD: ${DB_PASSWORD}"
echo "WP-USER: ${WP_USER}"

wp config create --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}" --path=/var/www --allow-root --skip-check --dbhost=mariadb

exec "$@"