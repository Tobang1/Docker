#!/usr/bin/env bash
source .env

docker ps --format "table {{.ID}}\t{{.Ports}}"
docker build -t $IMAGE_NAME_VERSION . 
docker images ls
# docker run -d $IMAGE_NAME_VERSION
docker run -d -p $LOCAL_PORT:80 $IMAGE_NAME_VERSION
docker ps
echo "docker-build successful"
# push image to dockerhub
# docker tag $IMAGE_NAME_VERSION $REPOSITORY_NAME
# docker push $REPOSITORY_NAME
# echo "push successful"



# PROJECT17
# docker run --name mysql -e MYSQL_ROOT_PASSWORD=Password123! -d mysql/mysql-server:latest
# docker network create  --subnet=172.31.38.107/24 tooling_app_network
