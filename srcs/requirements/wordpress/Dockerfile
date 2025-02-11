FROM debian:buster

COPY script/wait-for-it.sh /usr/local/bin/wait-for-it.sh

RUN apt update -y
RUN apt upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3 \
php-fpm \
php-mysql \
mariadb-client
RUN mkdir -p /run/php && chown -R www-data:www-data /run/php
RUN mkdir -p /var/www/html
RUN rm -rf /var/www/html/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN wp core download --allow-root

COPY conf/php.ini /etc/php/7.3/cli/

RUN chmod +x /usr/local/bin/wait-for-it.sh
#RUN /usr/local/bin/wait-for-it.sh mariadb:3306 --

#RUN wp config create --allow-root \
#	--dbname=$SQL_DATABASE \
#	--dbuser=$SQL_USER \
#	--dbpass=$SQL_PASSWORD \
#	--dbhost=mariadb:3306

#RUN wp core install --allow-root \
#	--url="https://doigt_dans_le_cul.com" \
#	--title="Vraiment un doigt dans le cul" \
#	--admin_user="Daniel" \
#	--admin_password="hijesuisgay" \
#    --admin_email="daniel_pro@pornhub.com"

#RUN wp user create user1 user1@example.com --role=editor \
#	--user_pass=user1_password --allow-root


EXPOSE 9000

#CMD ["php-fpm7.3", "-F"]

CMD /usr/local/bin/wait-for-it.sh mariadb:3306 -- wp config create \
    --allow-root \
    --dbname=$SQL_DATABASE \
    --dbuser=$SQL_USER \
    --dbpass=$SQL_PASSWORD \
    --dbhost=mariadb:3306 \
    && wp core install --allow-root \
    --url="https://doigt_dans_le_cul.com" \
    --title="Vraiment un doigt dans le cul" \
    --admin_user="Daniel" \
    --admin_password="hijesuisgay" \
    --admin_email="daniel_pro@pornhub.com" \
    && wp user create user1 user1@example.com --role=editor \
    --user_pass=user1_password --allow-root \
    && php-fpm7.3 -F
