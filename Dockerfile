FROM php:7.4-fpm
LABEL maintainer="maksimpesko@gmail.com"

# Set working directory
WORKDIR /var/www/html/

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpng-dev \
    libjpeg62-turbo-dev \
    libfreetype6-dev \
    locales \
    zip \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
# Clear cache
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Add php.ini config to docker images
ADD php.ini /usr/local/etc/php/conf.d/40-custom.ini

EXPOSE 9000

CMD ["php-fpm"]