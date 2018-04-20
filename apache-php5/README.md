Apache with latest PHP 5
-------------------------
This image have all necessary and frequently used Apache modules and PHP extentions installed and enabled by default. It also hides PHP and Apache version from response header. `Composer` is also available in this images
To run a container run this command below

```sh
docker run -dit --name my-awesome-php-app -v /path/to/public_html:/var/www/html -p 8080:80 -p 4433:443 nmrony/apache-php5
```

To update PHP setting please mount your **`.ini`** files as follows

```sh
docker run --rm --name php-test -dit -p 8000:80 -v ${PWD}/uploads.ini:/usr/local/etc/php/conf.d/uploads.ini -v $PWD/app:/var/www/html nmrony/apache-php5
```

Modules Enabled by default in Apache:
=====================================
- Rewrite
- Headers
- SSL
- Proxy
- Deflate
- XML

Extensions enabled in PHP
=========================
- MySQL
- MySQLi
- mbstring
- gd
- pdo
- pdo_mysql
- curl
- mcrypt
- phar
- xmlrpc
- iconv