FROM php:8.3-fpm-alpine

# Устанавливаем постоянные зависимости
RUN apk add --no-cache \
    icu-data-full \
    shadow \
    msmtp \
    perl \
    wget \
    procps \
    bash \
    libzip \
    libpng \
    libjpeg-turbo \
    libwebp \
    freetype \
    icu \
    zlib \
    imagemagick

# Временные зависимости и безопасная установка Composer
RUN apk add --no-cache --virtual .build-deps \
    icu-dev \
    zlib-dev \
    libzip-dev \
    libpng-dev \
    libwebp-dev \
    libjpeg-turbo-dev \
    freetype-dev && \
    docker-php-ext-configure gd \
        --enable-gd \
        --with-freetype \
        --with-jpeg \
        --with-webp && \
    docker-php-ext-install -j$(nproc) \
        gd \
        mysqli \
        pdo_mysql \
        intl \
        opcache \
        exif \
        zip && \
    apk del .build-deps && \
    rm -rf /tmp/*

# Composer (без strict проверок для скорости)
COPY --from=composer:2.8 /usr/bin/composer /usr/bin/composer

# Настройка пользователя и прав
RUN usermod -u 1000 www-data \
    && chown -R www-data:www-data /var/www \
    && chmod 1777 /tmp

USER www-data
WORKDIR /var/www/html