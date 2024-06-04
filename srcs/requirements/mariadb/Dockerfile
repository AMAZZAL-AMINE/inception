FROM debian:bookworm

RUN apt-get update && apt-get install -y mariadb-server \
    && mkdir /var/run/mysqld && chmod 777 /var/run/mysqld

COPY ./create_db.sh /

RUN chmod +x /create_db.sh

ENTRYPOINT ["sh", "/create_db.sh"]

CMD ["mariadbd", "--user=mysql", "--bind-address=0.0.0.0"]