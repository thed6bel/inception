#!/bin/bash

if [ ! -d "/var/www/html" ]; then
    mkdir -p /var/www/html
fi

if [ ! -f /var/www/html/wp-config.php ]; then
    sed -i 's#listen = 127.0.0.1:9000#listen = 0.0.0.0:9000#' /etc/php81/php-fpm.d/www.conf

    wget -O /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x /usr/local/bin/wp

    cd /var/www/html

    wp core download

    sleep 5;

    wp config create \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost=mariadb

    wp core install \
        --url="${DOMAIN_NAME}" \
        --title="${WP_TITLE}" \
        --admin_user="${WP_ROOT_USER}" \
        --admin_password="${WP_ROOT_PASSWORD}" \
        --admin_email="${WP_ROOT_EMAIL}"
    
    wp user create "${WP_USER}" "${WP_USER_EMAIL}" \
        --user_pass="${WP_USER_PASSWORD}" \
        --role=author
fi

exec php-fpm81 -F -R