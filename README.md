PHP-FPM
=====================
[![https://hub.docker.com/r/opencycle/php/](https://img.shields.io/docker/build/opencycle/php.svg)](https://hub.docker.com/r/opencycle/php)
[![Docker Pulls](https://img.shields.io/docker/pulls/opencycle/php.svg?maxAge=2592000)](https://hub.docker.com/r/opencycle/php)
[![](https://img.shields.io/microbadger/image-size/opencycle/php.svg?style=flat)](https://microbadger.com/images/opencycle/php)

This image provides PHP-FPM and the required PHP extensions for Opencycle.
It is based on the [Official PHP-FPM Alpine](https://hub.docker.com/_/php/) image.

# Supported tags and respective `Dockerfile` links

We provide the following version tags:

* [`7.3`, (*7.3/Dockerfile*)](https://github.com/opencycle/docker-php/blob/master/7.3/Dockerfile)
* [`7.2`, `latest` (*7.2/Dockerfile*)](https://github.com/opencycle/docker-php/blob/master/7.2/Dockerfile)
* [`7.1`, (*7.1/Dockerfile*)](https://github.com/opencycle/docker-php/blob/master/7.1/Dockerfile)

# Included Extensions

Additional extensions included in addition to the base PHP-FPM Docker image:

- `mcrypt`
- `opcache`
- `pdo_mysql`
- `pdo_pgsql`

# Usage

Use as part of a multi-stage build as your final application image:

```Dockerfile
FROM opencycle/php:7.2 as application

COPY . /srv/www
```

PHP-FPM will then be exposed on port `9000` you will need to use this image
in combination with a web server image like [`opencycle/nginx`](https://github.com/opencycle/docker-nginx).

```yaml
services:
  php:
    image: opencycle/php:7.2
    volumes:
      - ./:/srv/www
  nginx:
    image: opencycle/nginx:latest
    volumes:
      - ./:/srv/www
    ports:
      - 80:80
```
