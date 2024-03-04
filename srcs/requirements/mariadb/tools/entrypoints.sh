#!/bin/bash

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql

/usr/bin/mysqld --user=mysql --bootstrap << EOF

USE mysql;
FLUSH PRIVILEGES;

ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING PASSWORD('$MYSQL_ROOT_PASSWORD');
CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME;
CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED by '$WORDPRESS_DB_PASSWORD';
GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%';

FLUSH PRIVILEGES;
EOF

cp /mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

exec /usr/bin/mysqld --user=mysql --console