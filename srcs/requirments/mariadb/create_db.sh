#!/bin/bash

COLOR_YELLOW='\033[1;33m'
COLOR_RESET='\033[0m'
 
#'%' is a wildcard that matches any host, 0.0.0.0

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}'; \
    CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}; \
    CREATE USER IF NOT EXISTS '${MYSQL_USER_NAME}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}'; \
    GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER_NAME}'@'%'; \
    FLUSH PRIVILEGES;" > /tmp/db.sql

mariadbd --user=root --bootstrap < /tmp/db.sql

echo -e "📖 ${COLOR_YELLOW}ALL DONE ${COLOR_RESET}"
exec "$@"