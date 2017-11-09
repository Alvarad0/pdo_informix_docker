## Apache, PHP-FPM with Informix support.

|   |   |
|---|---|
| Ubuntu | 14.04.5 LTS |
| Apache | 2.4.7 |
| PHP | 5.5.9 |
| Informix PDO | 1.3.3 |
| Informix Client SDK | 4.10 |

* Based on [webdevops/php-apache:ubuntu-14.04](https://hub.docker.com/r/webdevops/php-apache/)
* Documentation for [webdevops/php-apache:ubuntu-14.04](http://dockerfile.readthedocs.io/en/latest/content/DockerImages/dockerfiles/php-apache.html)

# Example of the container starting:
``docker run --rm -it -p 80:80 -v $(pwd)/app:/app sbabych/pdo_informix``

# References

* [WebDevOps Dockerfiles documentation](http://dockerfile.readthedocs.io/)

https://github.com/webdevops/Dockerfile

https://gist.github.com/natsu90/6787b254929355c34e63

https://pecl.php.net/package/PDO_INFORMIX
