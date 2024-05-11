FROM debian:bookworm

RUN apt-get update -y && apt-get install -y nginx openssl

# Generate SSL Certificate and Key:

COPY ./conf/nginx.conf /etc/nginx/conf.d

RUN mkdir /etc/nginx/ssl && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=MA/ST=Martil/L=Martil/O=Example/CN=mamazzal.42.fr"

CMD ["nginx", "-g", "daemon off;"]