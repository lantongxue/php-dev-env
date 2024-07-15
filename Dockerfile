FROM debian:bullseye
LABEL org.opencontainers.image.source="https://github.com/lantongxue/php-dev-env"
RUN apt update && apt upgrade -y
RUN apt install apt-transport-https curl lsb-release wget net-tools inetutils-ping gnupg2 ca-certificates debian-archive-keyring -y
RUN curl https://nginx.org/keys/nginx_signing.key | gpg --dearmor | tee /usr/share/keyrings/nginx-archive-keyring.gpg > /dev/null
RUN echo "deb [signed-by=/usr/share/keyrings/nginx-archive-keyring.gpg] http://nginx.org/packages/debian `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list
RUN curl -sSLo /usr/share/keyrings/deb.sury.org-php.gpg https://packages.sury.org/php/apt.gpg
RUN sh -c 'echo "deb [signed-by=/usr/share/keyrings/deb.sury.org-php.gpg] https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
RUN apt update
RUN apt install php7.4 php7.4-dev php7.4-fpm php7.4-bcmath php7.4-curl php7.4-mysql php7.4-pgsql php7.4-mongodb php7.4-sqlite3 php7.4-msgpack php7.4-memcached php7.4-redis php7.4-imap php7.4-ldap php7.4-gd php7.4-imagick php7.4-mbstring php7.4-bz2 php7.4-gmp php7.4-intl php7.4-zip php7.4-readline php7.4-snmp php7.4-soap php7.4-xdebug php7.4-xml php7.4-xmlrpc php7.4-xsl -y
RUN apt install nginx -y

COPY conf/php/cli/php.ini /etc/php/7.4/cli/php.ini
COPY conf/php/fpm/php.ini /etc/php/7.4/fpm/php.ini
COPY conf/php/fpm/pool.d/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY conf/nginx/nginx.conf /etc/nginx/nginx.conf
COPY conf/nginx/pathinfo.conf /etc/nginx/pathinfo.conf
COPY conf/nginx/php7.4-fpm.conf /etc/nginx/php7.4-fpm.conf
COPY conf/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf

COPY conf/init.d/php7.4-fpm /etc/init.d/php7.4-fpm
RUN chmod +x /etc/init.d/php7.4-fpm

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 80 443

ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]