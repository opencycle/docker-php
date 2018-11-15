FROM php:7.2-fpm-alpine

RUN apk update && apk add --no-cache postgresql-dev && docker-php-ext-install pdo_mysql pdo_pgsql
