#!/bin/bash

echo "Running mysql_container ..."
docker run \
    --name mysql_container \
    -d \
    -p 3306:3306 \
    -t mysql
echo "Done!"
