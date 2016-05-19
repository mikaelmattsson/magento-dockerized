#!/usr/bin/env bash

CONTAINER_NAME="$(echo $(basename "$PWD") | sed 's/[^A-Za-z0-9]//g')";
CONTAINER_MYSQL_ROOT_PASSWORD="$(docker exec -i ${CONTAINER_NAME}_mysql_1 printenv MYSQL_ROOT_PASSWORD)";
DATE="$(date +%F_%H-%M-%S)";

mkdir -p ./db/backup

cd ./db/backup

docker exec -i $(echo $CONTAINER_NAME)_mysql_1 mysqldump -u root -p$(echo $CONTAINER_MYSQL_ROOT_PASSWORD) --databases project > ./$(echo $DATE).sql

tar -zcvf ./$(echo $DATE).sql.tar.gz ./$(echo $DATE).sql

rm ./$(echo $DATE).sql

RETENTION="7"
find . -type f -mtime +$RETENTION -name "*sql.tar.gz" -exec rm {} \;
