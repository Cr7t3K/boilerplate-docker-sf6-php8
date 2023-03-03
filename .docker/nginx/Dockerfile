# docker/nginx/Dockerfile

FROM nginx:alpine
RUN apk update \
    && apk add openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /home/local.app.com.key -out /home/local.app.com.crt -subj "/C=FR/ST=France/L=France/O=Security/OU=Development/CN=local.app.com"

WORKDIR /var/www
CMD ["nginx"]
EXPOSE 8080
EXPOSE 443
