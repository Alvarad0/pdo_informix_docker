!
# Apache, PHP-FPM with Informix support.

|   |   |
|---|---|
| Ubuntu | 14.04.5 LTS |
| Apache | 2.4.7 |
| PHP | 5.5.9 |
| Informix PDO | 1.3.3 |
| Informix Client SDK | 4.10.FC9DE |

* Based on [webdevops/php-apache:ubuntu-14.04](https://hub.docker.com/r/webdevops/php-apache/)
* Documentation for [webdevops/php-apache:ubuntu-14.04](http://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-apache.html)

# Example of the container starting:
``docker run --rm -it -p 80:80 -v $(pwd)/app:/app sbabych/pdo_informix``

# Docker Hub

[sbabych/pdo_informix](https://hub.docker.com/r/sbabych/pdo_informix/) - Add Informix support (pdo_informix) to webdevops/php-apache:ubuntu-14.04 docker image.

# References

* [WebDevOps Dockerfiles Documentation.](http://dockerfile.readthedocs.io/)
* [WebDevOps Dockerfiles GitHub.](https://github.com/webdevops/Dockerfile)
* [Installing PDO Informix.](https://gist.github.com/natsu90/6787b254929355c34e63)
* [PDO driver for IBM Informix databases.](https://pecl.php.net/package/PDO_INFORMIX)
* [Search for Informix Client SDKit 4.10.FC9DE.](https://www-01.ibm.com/marketing/iwm/tnd/search.jsp?rs=ifxdl)
