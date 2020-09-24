#!/bin/bash

# Image URL: https://hub.docker.com/_/mongo

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

name=mongo

docker stop $name 2> /dev/null
docker rm $name 2> /dev/null

docker run -d --name $name -p 27017:27017 \
  -e TZ=Asia/Shanghai \
  -v ${SCRIPTPATH}/_data:/data/db \
  mongo:4.0
# after startup, connect to it with dbeaver or other client
# dburi: mongodb://localhost:27017/local
