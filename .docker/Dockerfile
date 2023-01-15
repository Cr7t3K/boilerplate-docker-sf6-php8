# docker/php-fpm/Dockerfile

FROM php:8.2-fpm
ENV PHP_TIME_ZONE=Europe/Paris
RUN apt-get update --fix-missing
RUN apt-get install -y nano vim
RUN apt-get install -y curl git
RUN apt-get install -y wget build-essential libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev libicu-dev g++ \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd
RUN docker-php-ext-install pdo_mysql
RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip
RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		libc-client-dev \
		libkrb5-dev \
	; \
	rm -rf /var/lib/apt/lists/*

RUN curl -sS https://getcomposer.org/installer | php -- \
    &&  mv composer.phar /usr/local/bin/composer \
    &&  mv composer.phar /usr/local/bin/composer<

RUN curl -sS https://get.symfony.com/cli/installer | bash \
    &&  mv /root/.symfony/bin/symfony /usr/local/bin \
    &&  mv /root/.symfony/bin/symfony /usr/local/bin

RUN set -eux; \
	PHP_OPENSSL=yes docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
	docker-php-ext-install imap


WORKDIR /var/www

# docker/php-fpm/Dockerfile

FROM php:8.2-fpm
ENV PHP_TIME_ZONE=Europe/Paris
RUN apt-get update --fix-missing
RUN apt-get install -y nano vim
RUN apt-get install -y curl git
RUN apt-get install -y wget build-essential libssl-dev zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev libicu-dev g++ \
    && docker-php-ext-configure intl \
    && docker-php-ext-install intl
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd
RUN docker-php-ext-install pdo_mysql
RUN apt-get install -y \
        libzip-dev \
        zip \
  && docker-php-ext-install zip
RUN docker-php-ext-configure opcache --enable-opcache \
    && docker-php-ext-install opcache

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		libc-client-dev \
		libkrb5-dev \
	; \
	rm -rf /var/lib/apt/lists/*

RUN set -eux; \
	PHP_OPENSSL=yes docker-php-ext-configure imap --with-kerberos --with-imap-ssl; \
	docker-php-ext-install imap

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
RUN php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"

RUN mv composer.phar /usr/local/bin/composer


RUN curl -sS https://get.symfony.com/cli/installer | bash \
    &&  mv /root/.symfony5/bin/symfony /usr/local/bin/symfony

WORKDIR /var/www
