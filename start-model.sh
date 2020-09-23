#!/bin/bash
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

name=mongo

docker stop $name 2> /dev/null
docker rm $name 2> /dev/null

docker run -d --name $name -p 27017:27017 \
  -v ${SCRIPTPATH}/_data:/data/db \
  mongo:4.0
# after startup, connect to it with dbeaver or other client
# dburi: mongodb://localhost:27017/local
