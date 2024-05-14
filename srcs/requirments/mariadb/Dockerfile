FROM debian:latest

RUN apt-get update && apt-get install -y mariadb-server

RUN mkdir -p /var/run/mysqld
 
RUN chown -R mysql:mysql /var/run/mysqld

RUN chown -R mysql:mysql /var/lib/mysql

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql


COPY ./create_db.sh /

RUN chmod +x /create_db.sh

ENTRYPOINT ["/create_db.sh"]

CMD [ "mariadbd", "--user=mysql" ]