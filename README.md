# ROS desktop in a Docker container [![](https://img.shields.io/docker/pulls/frankjoshua/ros-desktop)](https://hub.docker.com/r/frankjoshua/ros-desktop) [![CI](https://github.com/frankjoshua/docker-ros-desktop/workflows/CI/badge.svg)](https://github.com/frankjoshua/docker-ros-desktop/actions)

## Description

Run ROS desktop components without installing ROS.
ROS_IP and ROS_MASTER_URI must be set.
Probably need --network="host" because ROS uses ephemeral ports.

## Example

```
./run.sh rostopic list
```

```
xhost +

docker run -it \
    --network="host" \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --env="ROS_IP=$ROS_IP" \
    --env="ROS_MASTER_URI=$ROS_MASTER_URI" \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    frankjoshua/ros-desktop
```

## Running ROS Desktop in Bash

Add this to your .bashrc file:

```
export ROS_MASTER_URI=http://<MASTER_IP>:11311
export ROS_IP=<IP_OF_HOST>

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
```

## Building

Use [build.sh](build.sh) to build the docker containers.

<br>Local builds are as follows:

```
./build.sh -t frankjoshua/ros-desktop -l
```

## Testing

Github Actions expects the DOCKERHUB_USERNAME and DOCKERHUB_TOKEN variables to be set in your environment.

## License

Apache 2.0

## Author Information

Joshua Frank [@frankjoshua77](https://www.twitter.com/@frankjoshua77)
<br>
[http://roboticsascode.com](http://roboticsascode.com)
