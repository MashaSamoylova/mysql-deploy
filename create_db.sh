#!/bin/bash

echo "Adding all priviliges for 'root' user..."

docker exec -it mysql-deploy_db_1 ./bin/mysql \
    -h localhost \
    -P 3306 \
    --protocol=tcp \
    -uroot \
    --execute="source /usr/local/create_db.sql"

echo "Done!"
