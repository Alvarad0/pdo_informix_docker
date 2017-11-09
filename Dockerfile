FROM sbabych/pdo_informix:toolbox AS toolbox

FROM webdevops/php-apache:ubuntu-14.04 AS builder

MAINTAINER Sergii Babych <babych.s@agromat.ua>

COPY --from=toolbox /opt/informix /opt/informix
