
FROM php:7.4-apache

# 1. development packages
RUN apt update && apt install -y --no-install-recommends \
  apt-utils \
  g++ \
  git \
  zip \
  unzip \
  dh-make \
  libonig-dev \
  libicu-dev \
  libbz2-dev \
  libssl-dev \
  libpng-dev \
  libzip-dev \
  libjpeg-dev \
  libxml2-dev \
  libc-client-dev \
  libkrb5-dev \
  libreadline-dev \
  libfreetype6-dev && \
  # cleanup
  apt clean && \
  apt autoclean && \
  rm -rf /var/lib/apt/lists/* && \
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
  docker-php-ext-install sockets exif soap bz2 intl iconv bcmath opcache json calendar mbstring pdo_mysql mysqli gd zip phar xmlrpc imap && \
  a2enmod rewrite headers ssl proxy_http proxy_ajp proxy_html proxy_connect deflate proxy_balancer xml2enc && \
  # composer
  cd /tmp && curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
