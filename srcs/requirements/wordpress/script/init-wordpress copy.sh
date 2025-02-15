#!/bin/bash

# Attendre que MariaDB soit prêt
/usr/local/bin/wait-for-it.sh mariadb:3306 --timeout=30 --strict -- echo "MariaDB is up!"

# Créer la configuration WordPress si elle n'existe pas
#if [ ! -f /var/www/html/wp-config.php ]; then
    wp config create \
        --allow-root \
        --dbname=$SQL_DATABASE \
        --dbuser=$SQL_USER \
        --dbpass=$SQL_PASSWORD \
        --dbhost=mariadb:3306 \
        --path=/var/www/html
        wp core install \
        --allow-root \
        --url="https://hclaude.42.fr" \
        --title="INCEPTION" \
        --admin_user="Daniel" \
        --admin_password="vivelecafe" \
        --admin_email="admin@example.com" \
        --path=/var/www/html
        wp user create user1 user1@example.com --role=editor --user_pass=user1_password --allow-root --path=/var/www/html
#fi

# Démarrer PHP-FPM
php-fpm7.3 -F