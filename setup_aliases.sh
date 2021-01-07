#!/bin/bash

alias rr='xhost +;
            docker run -it \
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