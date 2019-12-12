#!/bin/bash

if [ -z ${ROS_IP+x} ]; then echo "ROS_IP is not set"; exit 1; fi;
if [ -z ${ROS_MASTER_URI+x} ]; then echo "ROS_MASTER_URI is not set"; exit 1; fi;

xhost +

docker run -it \
    --network="host" \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="ROS_IP=$ROS_IP" \
    --env="ROS_MASTER_URI=$ROS_MASTER_URI" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    frankjoshua/ros-desktop $@