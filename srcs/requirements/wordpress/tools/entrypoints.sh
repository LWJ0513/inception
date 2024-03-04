#!/bin/bash

wp core download --allow-root --path=/var/www/html
wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$WORDPRESS_DB_USER --dbpass=$WORDPRESS_DB_PASSWORD --dbhost=$WORDPRESS_DB_HOST --skip-check --allow-root

wp core install --path=/var/www/html --url=$DOMAIN \
    --title="wordpress" \
    --admin_user=$WORDPRESS_DB_ADMIN_USER \
    --admin_password=$WORDPRESS_DB_ADMIN_PASSWORD \
    --admin_email=$ADMIN_EMAIL --allow-root

wp	user create \
	--allow-root \
	--path=/var/www/html \
	${WORDPRESS_USER} \
	${WORDPRESS_USER_EMAIL} \
	--role=author \
	--user_pass=${WORDPRESS_USER_PASSWORD}

/usr/sbin/php-fpm81 -F -R
