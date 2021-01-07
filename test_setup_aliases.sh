#!/bin/bash

export ROS_IP=127.0.0.1
export ROS_MASTER_URI=http://127.0.0.1:11311

alias rr='xhost +;
            docker run -it \
              --privileged \
              --network="host" \
              --env="DISPLAY" \
              --env="QT_X11_NO_MITSHM=1" \
              --env="ROS_IP=$ROS_IP" \
              --env="ROS_MASTER_URI=$ROS_MASTER_URI" \
              --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
              frankjoshua/ros-desktop'
              
alias rostopic='rr rostopic'
alias rosnode='rr rosnode'
alias rosmsg='rr rosmsg'
alias rviz='rr rviz'
alias rqt='rr rqt'
alias roscore='rr roscore'