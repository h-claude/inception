#FROM debian:buster

#COPY script/wait-for-it.sh /usr/local/bin/wait-for-it.sh

#RUN apt update -y
#RUN apt upgrade -y
#RUN apt-get -y install wget
#RUN apt-get install -y php7.3 \
#    php-fpm \
#    php-mysql \
#    mariadb-client
#RUN mkdir -p /run/php && chown -R www-data:www-data /run/php
#RUN mkdir -p /var/www/html
#RUN rm -rf /var/www/html/*

#RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
#RUN chmod +x wp-cli.phar
#RUN mv wp-cli.phar /usr/local/bin/wp
#RUN chmod -R +r /var/www/html

#RUN wp core download --allow-root

#COPY conf/php.ini /etc/php/7.3/cli/

#RUN chmod +x /usr/local/bin/wait-for-it.sh

#EXPOSE 9000

#CMD /usr/local/bin/wait-for-it.sh mariadb:3306 -- wp config create \

#RUN wait-for-it.sh mariadb:3306 -- wp config create \
#    --allow-root \
#    --dbname=$SQL_DATABASE \
#    --dbuser=$SQL_USER \
#    --dbpass=$SQL_PASSWORD \
#    --dbhost=mariadb:3306 \
#    && wp core install --allow-root \
#    --url="https://hclaude.42.fr" \
#    --title="INCEPTION" \
#    --admin_user="Daniel" \
#    --admin_password="vivelecafe" \
#    && wp user create user1

#RUN wp config create \
#    --allow-root \
#    --dbname=$SQL_DATABASE \
#    --dbuser=$SQL_USER \
#    --dbpass=$SQL_PASSWORD \
#    --dbhost=mariadb:3306 \
#    && wp core install --allow-root \
#    --url="https://hclaude.42.fr" \
#    --title="INCEPTION" \
#    --admin_user="Daniel" \
#    --admin_password="vivelecafe" \
#    && wp user create user1 user1@example.com --role=editor \
#    --user_pass=user1_password --allow-root

#CMD php-fpm7.3 -F

#CMD wait-for-it.sh mariadb:3306 -- wp config create \
#    --allow-root \
#    --dbname=$SQL_DATABASE \
#    --dbuser=$SQL_USER \
#    --dbpass=$SQL_PASSWORD \
#    --dbhost=mariadb:3306 \
#    && wp core install --allow-root \
#    --url="https://hclaude.42.fr" \
#    --title="INCEPTION" \
#    --admin_user="Daniel" \
#    --admin_password="vivelecafe" \
#    && wp user create user1 \
#    && php-fpm7.3 -F


    FROM debian:buster

    COPY script/wait-for-it.sh /usr/local/bin/wait-for-it.sh
    COPY script/init-wordpress.sh /usr/local/bin/init-wordpress.sh

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

    # Téléchargez et installez WP-CLI correctement
    RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
    RUN chmod +x /usr/local/bin/wp

    RUN wp core download --allow-root --path=/var/www/html

    COPY conf/php.ini /etc/php/7.3/cli/

    RUN chmod +x /usr/local/bin/wait-for-it.sh
    RUN chmod +x /usr/local/bin/init-wordpress.sh

    EXPOSE 9000

    CMD ["/usr/local/bin/init-wordpress.sh"]