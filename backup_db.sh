#!/bin/bash

source /opt/backup_secrets.env

mkdir -p /opt/backup

FILENAME="backup_$(date +%Y-%m-%d_%H-%M-%S).sql"

docker run --rm \
  --network shvirtd-example-python_backend \
  --entrypoint "" \
  -v /opt/backup:/backup \
  schnitzler/mysqldump \
  mysqldump --opt -h ${MYSQL_HOST} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} --result-file=/backup/${FILENAME}

echo "Backup created: /opt/backup/${FILENAME}"
