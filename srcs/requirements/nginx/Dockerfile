FROM debian:latest
# php amd fast cgi it should remove later
RUN apt-get update -y

#install what needed
RUN apt-get install -y nginx openssl 

# sgenerate SSL Certificate and Key:
COPY ./conf/nginx.conf /etc/nginx/conf.d

# also this shoud remove later
COPY ./indexs/* /

RUN mkdir /etc/nginx/ssl && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=MA/ST=Martil/L=Martil/O=Example/CN=mamazzal.42.fr"

RUN apt-get install -y php-fpm

CMD ["nginx", "-g", "daemon off;"]