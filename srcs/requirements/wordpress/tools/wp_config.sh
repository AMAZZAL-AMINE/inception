#!/bin/bash
# check if wordpress is already installed
if ! [ -f /var/www/wp-config.php ]; then
    wp config create --dbname="${DB_NAME}" --dbuser="${DB_USER}" \
        --dbpass="${DB_PASSWORD}"  --path=/var/www --allow-root \
        --skip-check --dbhost=mariadb

    # for welcome page
    wp core install --url="${WP_URL}" --title="${WP_SITE_TITLE}" \
        --admin_user="${WP_ADMIN}" --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}" --path=/var/www --allow-root

    # for wp user
    wp user create "${WP_USER}" "${WP_USER_EMAIL}" --role=author \
        --user_pass="${WP_USER_PASSWORD}" --path=/var/www --allow-root
fi
exec "$@"