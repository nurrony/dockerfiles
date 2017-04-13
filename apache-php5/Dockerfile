
FROM php:5.6-apache
Maintainer Nur Rony <pro.nmrony@gmail.com>
LABEL Name=apache-php5

RUN apt-get update && \
    apt-get install -y libfreetype6-dev \
    libjpeg62-turbo-dev \
    libcurl4-gnutls-dev \
    php5-mcrypt \
    libmcrypt-dev \
    libssl-dev \
    libxml2-dev \
    php5-imagick && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install mbstring && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/  && \
    docker-php-ext-install gd && \
    docker-php-ext-install pdo pdo_mysql && \
    docker-php-ext-install curl && \
    docker-php-ext-install mcrypt && \
    docker-php-ext-install phar && \
    docker-php-ext-install xmlrpc && \
    docker-php-ext-install iconv && \
    # enabling necessary modules
    a2enmod rewrite headers ssl proxy_http proxy_ajp proxy_html proxy_connect deflate proxy_balancer xml2enc && \
    cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
