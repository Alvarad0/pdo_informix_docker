FROM sbabych/pdo_informix:toolbox AS toolbox

FROM webdevops/php-apache:ubuntu-14.04 AS builder

MAINTAINER Sergii Babych <babych.s@agromat.ua>

ENV PDO_DIR=PDO_INFORMIX-1.3.3
ENV PDO_TARBALL=${PDO_DIR}.tgz
ENV PDO_URL=https://pecl.php.net/get/${PDO_TARBALL}

COPY --from=toolbox /opt/informix /opt/informix

RUN wget -O /tmp/${PDO_TARBALL} ${PDO_URL}
