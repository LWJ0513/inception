FROM alpine:3.18

RUN apk add --no-cache dumb-init mariadb mariadb-common mariadb-client

# Install MariaDB and necessary dependencies
RUN apk --no-cache add mariadb mariadb-client
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Copy custom configuration file
# 명령어의 첫 번째 인자는 나의 로컬 두 번째 인자는 컨테이너의 경로
COPY ./conf/mariadb-server.cnf /mariadb-server.cnf
COPY ./tools/entrypoints.sh /entrypoints.sh

RUN chmod +x /entrypoints.sh

EXPOSE 3306

# 컨테이너가 실행될 때 실행되는 쉘 스크립트
ENTRYPOINT ["/usr/bin/dumb-init", "--", "sh", "/entrypoints.sh"]
