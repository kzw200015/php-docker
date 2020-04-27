FROM php:7.4.5-fpm-alpine

RUN apk update \
    && apk add --virtual .build-tools --no-cache autoconf gcc g++ make \
    && apk --no-cache add ffmpeg graphicsmagick zip zlib-dev libjpeg-turbo-dev libpng-dev freetype-dev imagemagick-dev libzip-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install exif mysqli pdo_mysql zip bcmath \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del .build-tools