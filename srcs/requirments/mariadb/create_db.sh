#!/bin/bash

COLOR_YELLOW='\033[1;33m'
COLOR_RESET='\033[0m'

#'%' is a wildcard that matches any host, 0.0.0.0 
#!/bin/bash

#'%' is a wildcard that matches any host, 0.0.0.0

echo  -e "🛡 ${COLOR_YELLOW}Start Creating database ${COLOR_RESET}"
mariadbd --user=mysql --bootstrap "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}';"
echo -e "DATABASE NAME: ${MYSQL_DATABASE}"
echo -e "USER NAME: ${MYSQL_USER_NAME}"
echo -e "USER PASSWORD: ${MYSQL_USER_PASSWORD}"

mariadbd --user=mysql --bootstrap "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
echo -e "🛡 ${COLOR_YELLOW}Start Creating user ${COLOR_RESET}"
mariadbd --user=mysql --bootstrap "CREATE USER IF NOT EXISTS '${MYSQL_USER_NAME}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';"
# make the user have access to do anything on the database
mariadbd --user=mysql --bootstrap "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER_NAME}'@'%';"
echo -e "🛡 ${COLOR_YELLOW}Start Flushing privileges ${COLOR_RESET}"
mariadbd --user=mysql --bootstrap "FLUSH PRIVILEGES;"
# show tables
echo -e "${COLOR_YRLLOW}"
mariadbd --user=mysql --bootstrap <<EOF
USE ${MYSQL_DATABASE};
SHOW TABLES;
EOF
echo -e "${COLOR_RESET}"
echo -e "📖 ${COLOR_YELLOW}ALL DONE ${COLOR_RESET}"
exec "$@"