#!/bin/bash

DOCKER_IMAGE_NAME=rtvc:latest
DOCKER_CONTAINER_NAME=rtvc

if [[ "$(docker images -q $DOCKER_IMAGE_NAME 2> /dev/null)" == "" ]]
then
    docker build -t $DOCKER_IMAGE_NAME .
fi

docker run -it \
           --name $DOCKER_CONTAINER_NAME \
           --ipc=host \
           --ulimit memlock=-1 \
           --ulimit stack=67108864 \
           --gpus all \
           --mount type=bind,src=./,dst=/work/ \
           $DOCKER_IMAGE_NAME
