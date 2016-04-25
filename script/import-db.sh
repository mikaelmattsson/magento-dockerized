#!/usr/bin/env bash

docker exec -i magentodockerized_mysql_1 mysql -uroot -pchange_me2 project < ./db/db.sql
