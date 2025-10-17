FROM php:8.3-fpm-alpine

WORKDIR /var/www/html

RUN apk add --no-cache --update \
    git \
    curl \
    unzip \
    libzip-dev \
    supervisor \
    sqlite-dev \
    icu-dev

RUN docker-php-ext-install zip pdo pdo_sqlite intl

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY . .

RUN composer install --no-interaction --no-plugins --no-scripts --prefer-dist

RUN php artisan key:generate
RUN php artisan storage:link
RUN chmod -R 775 storage bootstrap/cache
RUN chown -R www-data:www-data storage bootstrap/cache

EXPOSE 9000
CMD ["php-fpm"]
