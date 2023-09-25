#!/bin/bash

docker run -d -p 3306:3306 \
  -e MYSQL_ROOT_PASSWORD=abc123 \
  --mount type=volume,src=myvol,dst=/var/lib/mysql \
  --name mysql \
  mysql:8