FROM debian:bullseye

COPY script/init-wordpress.sh /usr/local/bin/init-wordpress.sh

RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.4 \
    php-fpm \
    php-mysql \
    mariadb-client \
    curl
RUN mkdir -p /run/php && chown -R www-data:www-data /run/php
RUN mkdir -p /var/www/html

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp
RUN sed -i 's/^listen = .*/listen = 9000/' /etc/php/7.4/fpm/pool.d/www.conf

RUN wp core download --allow-root --path=/var/www/html

RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

RUN chmod +x /usr/local/bin/init-wordpress.sh

EXPOSE 9000

CMD ["/usr/local/bin/init-wordpress.sh"]
