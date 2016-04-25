#!/usr/bin/env bash

docker exec -i $(echo $(basename "$PWD") | sed 's/[^A-Za-z0-9]//g')_mysql_1 mysql -uroot -pyg789u0ijhvtr678ygtr678yh6f8787 project < ./db/db.sql
