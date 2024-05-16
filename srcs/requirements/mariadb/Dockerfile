FROM debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server \
    && mkdir /var/run/mysqld && chmod 777 /var/run/mysqld \
    && mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY ./create_db.sh /

RUN chmod +x /create_db.sh

ENTRYPOINT ["/create_db.sh"]

CMD ["mariadbd", "--user=mysql"]