#!/bin/bash

# Image URL: https://hub.docker.com/_/mysql

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

name=mysql

docker stop $name 2> /dev/null
docker rm $name 2> /dev/null

docker run -d --name $name -p 3306:3306 \
  -e TZ=Asia/Shanghai \
  -v ${SCRIPTPATH}/_data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=adminpass \
  mysql:5.7

# then you can login to db with mysql client by below command
# mysql -u root --protocol=tcp -padminpass
