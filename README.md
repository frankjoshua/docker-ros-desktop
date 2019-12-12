### ROS desktop in a Docker container
Run ROS desktop components without installing ROS.
ROS_IP and ROS_MASTER_URI must be set.

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

### Example
```
./run.sh rostopic list
```