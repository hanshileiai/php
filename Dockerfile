FROM php:7.1-fpm

RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev git \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
    && docker-php-ext-install gd pdo_mysql zip opcache \
    && curl -sS https://getcomposer.org/installer | php -d detect_unicode=Off
    && mv composer.phar /usr/local/bin/composer