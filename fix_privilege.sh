#!/bin/bash

docker exec -it mysql_container ./bin/mysql \
    -h localhost \
    -P 3306 \
    --protocol=tcp \
    -uroot \
    --execute="CREATE USER 'root'@'%'; GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;"


