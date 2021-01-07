FROM ros:melodic-ros-base

RUN apt-get update &&\
    apt-get install -y ros-$ROS_DISTRO-desktop-full &&\
    apt-get -y clean &&\
    apt-get -y purge &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["rosrun", "rviz", "rviz"]