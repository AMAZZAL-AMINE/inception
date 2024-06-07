FROM debian:bookworm

#install what needed
RUN apt-get update -y \
    && apt-get install -y nginx openssl \
    && mkdir /etc/nginx/ssl

COPY ./tools/* /etc/nginx/ssl/

COPY ./conf/nginx.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]