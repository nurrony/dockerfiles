Apache with PHP 5.6.34
-----------------------
This image have all necessary and frequently used Apache modules installed and enabled by default. It also hides
PHP version from header.

To run a container run this command below

```sh
docker run -dit --name my-awesome-php-app -v /path/to/public_html:/var/www/html -p 8080:80 -p 4433:443 nmrony/apache-php5
```

To update PHP setting please mount your **`.ini`** files as follows

```sh
docker run --rm --name php-test -dit -p 8000:80 -v $PWD/uploads.ini:/usr/local/etc/php/conf.d/uploads.ini -v $PWD/app:/var/www/html nmrony/apache-php5
```

Modules Enabled by default:
===========================
- Rewrite
- Headers
- SSL
- Proxy
- Deflate
- XML