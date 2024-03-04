FROM alpine:3.18

# 작업 디렉토리 설정
WORKDIR /var/www/html

RUN apk update && apk upgrade && \
    apk add --no-cache dumb-init php php-fpm php-mysqli php-json php-openssl \
    php-curl php-zlib php-xml php-phar php-intl php-dom php-xmlreader \
    php-ctype php-session php-mbstring mariadb-client

# wordpress를 cli로 설치하고 설정하기 위한 wp-cli 설치
RUN	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN	chmod +x wp-cli.phar
RUN	mv wp-cli.phar /usr/bin/wp

RUN adduser -D -S -G www-data www-data

COPY --chmod=755 ./conf/wordpress.conf /etc/php81/php-fpm.d/www.conf
COPY --chmod=777 ./tools/entrypoints.sh /entrypoints.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--", "sh", "/entrypoints.sh"]