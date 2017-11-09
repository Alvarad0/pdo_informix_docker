FROM sbabych/pdo_informix:toolbox AS toolbox

FROM webdevops/php-apache:ubuntu-14.04 AS builder

ENV PDO_DIR=PDO_INFORMIX-1.3.3
ENV PDO_TARBALL=${PDO_DIR}.tgz
ENV PDO_URL=https://pecl.php.net/get/${PDO_TARBALL}

ENV INFORMIXDIR=/opt/informix

COPY --from=toolbox /opt/informix /opt/informix

RUN apt-get update \
 && apt-get -y install php5-dev \
 && ln -s php5 /usr/include/php \
 && wget -O /tmp/${PDO_TARBALL} ${PDO_URL} \
 && cd /tmp \
 && tar -xf ${PDO_TARBALL} \
 && cd /tmp/${PDO_DIR} \
 && phpize \
 && ./configure \
 && make install \
 && cd /etc/php5/mods-available \
 && echo "extension=pdo_informix.so" > pdo_informix.ini \
 && cd /etc/php5/fpm/conf.d \
 && ln -s ../../mods-available/pdo_informix.ini 20-pdo_informix.ini \
 && cd /etc/php5/cli/conf.d \
 && ln -s ../../mods-available/pdo_informix.ini 20-pdo_informix.ini

FROM webdevops/php-apache:ubuntu-14.04

MAINTAINER Sergii Babych <babych.s@agromat.ua>

ENV INFORMIXDIR=/opt/informix

COPY --from=toolbox /opt/informix /opt/informix
COPY --from=builder /usr/lib/php5/20121212/pdo_informix.so \
                    /usr/lib/php5/20121212/pdo_informix.so

RUN cd /etc/php5/mods-available \
 && echo "extension=pdo_informix.so" > pdo_informix.ini \
 && cd /etc/php5/fpm/conf.d \
 && ln -s ../../mods-available/pdo_informix.ini 20-pdo_informix.ini \
 && cd /etc/php5/cli/conf.d \
 && ln -s ../../mods-available/pdo_informix.ini 20-pdo_informix.ini
