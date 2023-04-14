# Developer: Nur Rony <pro.nmrony@gmail.com>
#
# GitHub:  https://github.com/nmrony
# Twitter: https://twitter.com/nmrony
# Docker:  https://hub.docker.com/u/nmrony

FROM php:8-apache

LABEL maintainer="Nur Rony<pro.nmrony@gmail.com>"

# Optional Configuration Parameter during build
ARG TZ

ENV TZ=${TZ:-UTC}

# 1. development packages
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone && \
  apt-get update && apt-get install -y --no-install-recommends \
  apt-utils \
  curl \
  g++ \
  zip \
  unzip \
  dh-make \
  libicu-dev \
  libpq-dev \
  libbz2-dev \
  libcap2-bin \
  libssl-dev \
  libzip-dev \
  # libjpeg-dev \
  libfreetype6-dev \
  libjpeg62-turbo-dev \
  libpng-dev \
  webp \
  imagemagick \
  libmagickwand-dev \
  libwebp-dev \
  libxml2-dev \
  supervisor \
  libc-client-dev \
  libcurl4-openssl-dev \
  libkrb5-dev \
  libreadline-dev \
  libldb-dev \
  libldap2-dev \
  libmcrypt-dev \
  libfreetype6-dev \
  libmemcached-dev \
  libmagickwand-dev \
  zlib1g-dev \
  libonig-dev && \
  # cleanup
  apt-get clean && \
  apt-get autoclean && \
  apt-get -y autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  curl -sSLo pickle https://github.com/FriendsOfPHP/pickle/releases/latest/download/pickle.phar && \
  chmod +x pickle && \
  mv ./pickle /usr/local/bin/ && \
  # Hide PHP version header
  { echo 'expose_php = Off'; } > $PHP_INI_DIR/conf.d/expose_php.ini && \
  # Hide Apache version
  { \
  echo ''; \
  echo '# Hide Apache version'; \
  echo 'ServerTokens ProductOnly'; \
  echo 'ServerSignature Off'; \
  } >> $APACHE_CONFDIR/apache2.conf && \
  mv "$PHP_INI_DIR/php.ini-development" "$PHP_INI_DIR/php.ini" && \
  docker-php-ext-configure imap --with-kerberos --with-imap-ssl && \
  docker-php-ext-configure gd --with-freetype --with-jpeg && \
  docker-php-ext-install sockets exif soap curl bz2 intl iconv bcmath opcache calendar mbstring pgsql pdo_mysql pdo_pgsql mysqli gd zip phar imap ldap && \
  pickle install imagick && \
  pickle install mcrypt && \
  pickle install xmlrpc && \
  pickle install igbinary && \
  pickle install memcached && \
  pickle install msgpack && \
  pickle install mongodb && \
  pickle install swoole && \
  docker-php-ext-enable imagick mcrypt xmlrpc igbinary memcached msgpack mongodb && \
  a2enmod rewrite headers ssl proxy_http proxy_ajp proxy_html proxy_connect deflate proxy_balancer xml2enc && \
  # composer
  cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

