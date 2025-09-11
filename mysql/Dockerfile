FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN groupadd -r mysql && \
    useradd -r -g mysql mysql

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      netcat \
      gnupg \
      rsync

RUN { \
  echo mysql-server mysql-server/root_password password 'root'; \
  echo mysql-server mysql-server/root_password_again password 'root'; \
} | debconf-set-selections && \
    apt-get update && \
    apt-get install -y \
      mysql-client \
      mysql-server && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld && \
    chown mysql:mysql /run/mysqld
VOLUME /run/mysqld

COPY scripts /usr/local/bin
RUN chmod 755 /usr/local/bin/*

ENV MYSQL_TCP_PORT=3306

ADD my.cnf /etc/mysql/mysql.cnf
ADD tls/ca.pem /etc/mysql/ssl/ca.pem
ADD tls/server-cert.pem /etc/mysql/ssl/server-cert.pem
ADD tls/server-key.pem /etc/mysql/ssl/server-key.pem
RUN chown -R mysql:mysql /etc/mysql/ssl


# MTK - A toolkit for exporting, sanitizing and packaging MySQL database.
# https://github.com/skpr/mtk
COPY --from=ghcr.io/skpr/mtk:v2.1.1 /usr/local/bin/mtk /usr/local/bin/mtk

USER mysql

CMD ["/usr/local/bin/mysql-start"]
