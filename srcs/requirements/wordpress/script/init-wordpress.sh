#!/bin/bash

# Attendre que MariaDB soit prêt
/usr/local/bin/wait-for-it.sh mariadb:3306 --timeout=30 --strict -- echo "MariaDB is up!"

# Créer wp-config.php
if [ ! -f /var/www/html/wp-config.php ]; then
    cat > /var/www/html/wp-config.php <<EOL
<?php
define('DB_NAME', '${SQL_DATABASE}');
define('DB_USER', '${SQL_USER}');
define('DB_PASSWORD', '${SQL_PASSWORD}');
define('DB_HOST', 'mariadb:3306');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
/**define('TITLE', 'INCEPTION');*/
/**define('ADMIN_USER', 'Daniel');*/
/**define('ADMIN_PASSWORD', 'vivelecafe');*/
/**#define('ADMIN_EMAIL', '');*/
/**define('WP_DEBUG', false);*/

$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)

\$table_prefix = 'wp_';

define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
    define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
EOL
wp core install \
        --allow-root \
        --url=$WP_URL \
        --title=$WP_TITLE \
        --admin_user=$WP_USER \
        --admin_password=$WP_PASSWORD \
        --admin_email=$WP_EMAIL \
        --path=/var/www/html
wp user create user1 user1@example.com --role=editor --user_pass=user1_password --allow-root --path=/var/www/html
wp theme install twentytwentyfour --activate --path=/var/www/html --allow-root

echo "wp-config.php created!"
fi


echo "wordpress is up!"
# Démarrer PHP-FPM
php-fpm7.3 -F