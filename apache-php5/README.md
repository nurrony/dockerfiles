Apache with PHP 5.6.33
-----------------------
This image have all necessary and frequently used Apache modules installed and enabled by default

To run a container run this command below

```sh
docker run -dit --name my-awesome-php-app -v /path/to/public_html:/var/www/html -p 8080:80 -p 4433:443 nmrony/apache-php5
```
Modules Enabled by default:
===========================
- Rewrite
- Headers
- SSL
- Proxy
- Deflate
- XML