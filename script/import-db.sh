#!/usr/bin/env bash

CONTAINER_NAME="$(echo $(basename "$PWD") | sed 's/[^A-Za-z0-9]//g')";
CONTAINER_MYSQL_ROOT_PASSWORD="$(docker exec -i ${CONTAINER_NAME}_mysql_1 printenv MYSQL_ROOT_PASSWORD)";

docker exec -i $(echo $CONTAINER_NAME)_mysql_1 mysql -uroot -p$(echo $CONTAINER_MYSQL_ROOT_PASSWORD) project < ./db/db.sql
