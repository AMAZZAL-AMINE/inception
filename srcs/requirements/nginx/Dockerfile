FROM debian:bookworm

#install what needed
RUN apt-get update -y \
    && apt-get install -y nginx openssl \
    && mkdir /etc/nginx/ssl \
    && openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=MA/ST=Martil/L=Martil/O=Example/CN=mamazzal.42.fr"

# sgenerate SSL Certificate and Key:
COPY ./conf/nginx.conf /etc/nginx/conf.d

# also this shoud remove later
COPY ./indexs/* /


CMD ["nginx", "-g", "daemon off;"]