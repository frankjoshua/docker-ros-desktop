FROM ros:melodic-ros-base

RUN apt-get update --allow-insecure-repositories &&\
    apt-get install --allow-unauthenticated -y ros-$ROS_DISTRO-desktop-full &&\
    apt-get -y clean &&\
    apt-get -y purge &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["rosrun", "rviz", "rviz"]