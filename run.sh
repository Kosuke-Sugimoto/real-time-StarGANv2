#!/bin/bash

HOST_TYPE=wsl
DOCKER_IMAGE_NAME=rtvc:latest
DOCKER_CONTAINER_NAME=rtvc
NOW_WINDOWS11_IP=tcp:$(grep nameserver /etc/resolv.conf | awk '{print $2}')

if [[ "$(docker images -q $DOCKER_IMAGE_NAME 2> /dev/null)" == "" ]]
then
    docker build -t $DOCKER_IMAGE_NAME .
fi

# -e "PULSE_SERVER~ で pulseaudio の通信先を設定
# pulseaudio で通信するため、wslg をマウント
if [ $HOST_TYPE == "wsl" ]
then
docker run -it \
           -e "PULSE_SERVER=$NOW_WINDOWS11_IP" \
           --name $DOCKER_CONTAINER_NAME \
           --ipc=host \
           --ulimit memlock=-1 \
           --ulimit stack=67108864 \
           --gpus all \
           --mount type=bind,src=./,dst=/work/ \
           --mount type=bind,src=/mnt/wslg/,dst=/mnt/wslg \
           $DOCKER_IMAGE_NAME
else
docker run -it \
           --device /dev/snd \
           --name $DOCKER_CONTAINER_NAME \
           --ipc=host \
           --ulimit memlock=-1 \
           --ulimit stack=67108864 \
           --gpus all \
           --mount type=bind,src=./,dst=/work/ \
           $DOCKER_IMAGE_NAME
fi
