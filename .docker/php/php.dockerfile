FROM php:8.2-fpm

# Arguments defined in docker-compose.yml
ARG user
ARG uid

COPY ./.docker/php/php.ini /usr/local/etc/php/conf.d/php.ini

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Install required packages
RUN apt-get update && apt-get install -y \
    git \
    libzip-dev \
    zip \
    unzip \
    curl\
    libwebp-dev \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    vim \
    nano \
    && apt-get install -y yarn \
    && apt-get -y autoremove

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql fileinfo zip 


# Set working directory
WORKDIR /var/www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]



