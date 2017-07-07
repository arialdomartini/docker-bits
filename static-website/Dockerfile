# Version: 0.0.1
FROM nginx:stable
MAINTAINER Arialdo Martini "arialdomartini@gmail.com"

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./site.conf /etc/nginx/conf.d/default.conf

RUN touch /var/run/nginx.pid && \
    chown -R www-data:www-data /var/run/nginx.pid && \
    chown -R www-data:www-data /var/cache/nginx

COPY ./site/index.html /usr/share/nginx/html
USER www-data


EXPOSE 8080
