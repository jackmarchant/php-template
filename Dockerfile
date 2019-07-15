FROM php:7-fpm
LABEL maintainer="jack@jackmarchant.com"

RUN docker-php-ext-install pdo_mysql 

# Install Composer (dev only)
RUN apt-get update && \
    apt-get install -y --no-install-recommends git zip

RUN curl --silent --show-error https://getcomposer.org/installer | php

COPY . /var/www/html/
EXPOSE 9000