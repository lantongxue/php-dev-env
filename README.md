# php-dev-env
This is a docker-based php development environment that includes most of the popular php extensions and supports xdebug debugging.

# includes extensions
```shell
[PHP Modules]
bcmath
bz2
calendar
Core
ctype
curl
date
dom
exif
FFI
fileinfo
filter
ftp
gd
gettext
gmp
hash
iconv
igbinary
imagick
imap
intl
json
ldap
libxml
mbstring
memcached
mongodb
msgpack
mysqli
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_pgsql
pdo_sqlite
pgsql
Phar
posix
readline
redis
Reflection
session
shmop
SimpleXML
snmp
soap
sockets
sodium
SPL
sqlite3
standard
sysvmsg
sysvsem
sysvshm
tokenizer
xdebug
xml
xmlreader
xmlrpc
xmlwriter
xsl
Zend OPcache
zip
zlib

[Zend Modules]
Xdebug
Zend OPcache
```

# how to use

1. Pull the docker image
```shell
docker pull ghcr.io/lantongxue/php-dev-env:7.4.33
```
2. Run your project in docker
```shell
docker run --rm -it -v C:\myprojects\blog:/var/www/html -p 81:80 --add-host=host.docker.internal:host-gateway php-dev-env:7.4.33
```
Happy development!😊

# how to debug your project
Step 1: Make sure your docker is up to date, then add the `--add-host=host.docker.internal:host-gateway` parameter when you run the image. The purpose of this parameter is to provide containers with access to the host, which can be accessed in the container by `ping host.docker.internal` to get the host ip address.

Step 2: Set up your local development tools and configure the xdebug listening option to listen on port 9003 by default.

> For phpstorm, you may need to configure directory mapping to debug properly.

# advanced options
Image default configuration files:
|software|config path|
|-|-|
|php|/etc/php/7.4|
|nginx|/etc/nginx|

**`/etc/nginx/conf.d/default.conf` is the default site configuration file**

**`/var/www/html` is the default site path**

**The image exposes ports 80 and 443 by default**