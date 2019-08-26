#!/bin/bash
APP=$1
BASE_PATH=$(cd `dirname $0`; pwd)
DOCKER_CONTAINER_NAME=docker-wine

killall xdg-open-server
$BASE_PATH/../contrib/xdg-open-server/xdg-open-server&
docker start $DOCKER_CONTAINER_NAME
docker exec -d $DOCKER_CONTAINER_NAME /usr/bin/caretpos.sh $APP
docker exec -i $DOCKER_CONTAINER_NAME /usr/bin/nohup /bin/bash &>/dev/null $APP &
