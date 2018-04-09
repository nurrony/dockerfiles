# Developer: Nur Rony <pro.nmrony@gmail.com>
#
# GitHub:  https://github.com/nmrony
# Twitter: https://twitter.com/nmrony
# Docker:  https://hub.docker.com/u/nmrony

FROM php:5.6-apache
LABEL Maintainer="Nur Rony <pro.nmrony@gmail.com>"
LABEL Name=apache-php5

RUN apt-get update && \
    apt-get install -y -qq --no-install-recommends libfreetype6-dev \
    libjpeg62-turbo-dev \
    libssl-dev \
    libcurl4-gnutls-dev \
    libmcrypt-dev \
    libxml2-dev \
    mcrypt \
    curl \
    dh-make && \
    # cleanup
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* && \
    # Hide PHP version header
    { echo 'expose_php = Off'; } > /usr/local/etc/php/conf.d/expose_php.ini && \
    # enable necessary extensions
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && \
    docker-php-ext-install soap mysql mysqli mbstring gd pdo pdo_mysql curl mcrypt phar xmlrpc iconv && \
    # enabling necessary modules
    a2enmod rewrite headers ssl proxy_http proxy_ajp proxy_html proxy_connect deflate proxy_balancer xml2enc && \
    cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
