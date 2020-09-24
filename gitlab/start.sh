#!/bin/bash

# Image URL: https://hub.docker.com/r/gitlab/gitlab-ce

# no need to install additional Database, quite convenient
# First time, it will ask you to reset the password for admin user
# then you can login with, root/new-password-you-set,
# also you can register new users

# It requires at least 2G memory, and consumes a large part of CPU
# It may not OK to run inside VPS. Be careful!!
SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")

name=gitlab
docker stop $name
docker rm $name
docker run -d --name $name \
  -v ${SCRIPTPATH}/_data/opt:/var/opt/gitlab \
  -v ${SCRIPTPATH}/_data/etc:/etc/gitlab \
  -v ${SCRIPTPATH}/_data/log:/var/log/gitlab \
  -p 8088:80 \
  -p 3422:22 \
  gitlab/gitlab-ce

# after startup, access: http://localhost:8088/
