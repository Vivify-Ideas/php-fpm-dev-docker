FROM php:7.2-fpm

# Install additional php dependencies
RUN apt-get -y update \
    && apt-get install -y libicu-dev libmcrypt-dev libpng-dev zlib1g-dev \
    unzip python cron supervisor libjpeg62-turbo-dev libfreetype6-dev mysql-client \
    && pecl install mcrypt-1.0.1 \
    && docker-php-ext-configure intl \
    && docker-php-ext-enable mcrypt\
    && docker-php-ext-configure gd \
    --with-freetype-dir=/usr/lib/ \
    --with-png-dir=/usr/lib/ \
    --with-jpeg-dir=/usr/lib/ \
    && docker-php-ext-install intl gd pdo_mysql zip

# Set working directory
WORKDIR /app

# Copy custom.ini for DEVELOPMENT PURPOSES
# DO NOT USE THIS IN PRODUCTION!
COPY custom.ini /usr/local/etc/php/conf.d/custom.ini

# Install Composer
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

