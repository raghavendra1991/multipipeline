#!/bin/bash
# Variables
IMAGE_NAME=duvva/python_webapp
# Map the volume with host machine
SRC_DATA=/home/duvva/python_webapp/src_data/
DST_DATA=/app
#######################################
echo "Build Docker Image"
docker build -t ${IMAGE_NAME}:latest .
echo "Cheching the containers status & run the containers"
docker inspect --format="{{.State.Running}}" $1
if [ $? -eq 0 ];
then
   echo "existing"
   echo "Remove the container"
   docker rm -f $1
   echo "Run the Docker Container"
   docker run -it -d --name="$1" -p 8080:80 -v ${SRC_DATA}:${DST_DATA} --restart always ${IMAGE_NAME}:latest 
else
  echo "missing"
  echo "Run the Docker Container"
  docker run -it -d --name="$1" -p 8080:80 -v ${SRC_DATA}:${DST_DATA} --restart always ${IMAGE_NAME}:latest
fi
