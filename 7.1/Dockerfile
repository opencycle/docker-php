FROM php:7.1-fpm-alpine

RUN apk update \
    && apk add --no-cache postgresql-dev \
    && docker-php-ext-install mcrypt opcache pdo_mysql pdo_pgsql \
    && rm -rf /tmp/* /var/cache/apk/*

WORKDIR /srv/www

MAINTAINER Ben Speakman <ben@3sq.re>
