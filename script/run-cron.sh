#!/usr/bin/env bash

CONTAINER_NAME="$(echo $(basename "$PWD") | sed 's/[^A-Za-z0-9]//g')";

docker exec $(echo $CONTAINER_NAME)_php_1 /bin/sh /var/www/html/cron.sh cron.php -m=default
docker exec $(echo $CONTAINER_NAME)_php_1 /bin/sh /var/www/html/cron.sh cron.php -m=always
