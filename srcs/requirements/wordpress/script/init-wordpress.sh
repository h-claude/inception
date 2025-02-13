#!/bin/bash

if [ ! -f /var/www/html/wp-config.php ]; then
    /usr/local/bin/wait-for-it.sh mariadb:3306 -- wp config create \
        --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 \
        --path=/var/www/html \
        && wp core install --allow-root \
        --url="https://hclaude.42.fr" \
        --title="INCEPTION" \
        --admin_user="Daniel" \
        --admin_password="vivelecafe" \
        --path=/var/www/html \
        && wp user create user1 user1@example.com --role=editor --user_pass=user1_password --allow-root --path=/var/www/html
fi

php-fpm7.3 -F