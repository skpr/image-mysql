FROM skpr/mysql:8.x-v1-latest-amd64

ARG db_name=local
ARG db_user=local
ARG db_pass=local
ARG db_file=/tmp/db.sql

ADD db.sql ${db_file}

RUN database-import ${db_name} ${db_user} ${db_pass} ${db_file}

ENTRYPOINT ["/usr/local/bin/mysql-start"]