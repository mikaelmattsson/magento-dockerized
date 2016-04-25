#!/usr/bin/env bash

docker exec -i $(echo $(basename "$PWD") | sed 's/[^A-Za-z0-9]//g')_mysql_1 mysql -uroot -p$(printenv MYSQL_ROOT_PASSWORD) project << EOF
    UPDATE core_config_data
    SET value = 'http://$1/'
    WHERE path = "web/unsecure/base_url";
EOF

docker exec -i $(echo $(basename "$PWD") | sed 's/[^A-Za-z0-9]//g')_mysql_1 mysql -uroot -p$(printenv MYSQL_ROOT_PASSWORD) project << EOF
    UPDATE core_config_data
    SET value = 'https://$1/'
    WHERE path = "web/secure/base_url";
EOF

docker exec -i $(echo $(basename "$PWD") | sed 's/[^A-Za-z0-9]//g')_mysql_1 mysql -uroot -p$(printenv MYSQL_ROOT_PASSWORD) project << EOF
    SELECT * FROM core_config_data
    WHERE path LIKE "web/%/base_url";
EOF
