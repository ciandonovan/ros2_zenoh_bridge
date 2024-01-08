### Build

```
https://github.com/ciandonovan/ros2_zenoh_bridge.git
cd ros2_zenoh_bridge
git submodule init
git submodule update
podman build -t localhost/$(basename $PWD) .
```

### Run

```
podman run --rm -it --net=host localhost/ros2_zenoh_bridge:latest /ros_entrypoint.sh ros2 launch akara_zenoh zenoh_launch.py
```

### Output

```
[INFO] [launch]: All log files can be found below /root/.ros/log/XXXXXXXXXXXXXXXXXXXXXXx
[INFO] [launch]: Default logging verbosity is set to INFO
[INFO] [zenoh_bridge_ros2dds-1]: process started with pid [54]
[zenoh_bridge_ros2dds-1] [2024-01-08T19:12:14Z INFO  zenoh_bridge_ros2dds] zenoh-bridge-ros2dds v0.11.0-dev built with rustc 1.70.0 (90c541806 2023-05-31) (built from a source tarball)
[zenoh_bridge_ros2dds-1] error: Found argument '--ros-args' which wasn't expected, or isn't valid in this context
[zenoh_bridge_ros2dds-1] 
[zenoh_bridge_ros2dds-1] 	Did you mean '--ros-localhost-only'?
[zenoh_bridge_ros2dds-1] 
[zenoh_bridge_ros2dds-1] 	If you tried to supply `--ros-args` as a value rather than a flag, use `-- --ros-args`
[zenoh_bridge_ros2dds-1] 
[zenoh_bridge_ros2dds-1] USAGE:
[zenoh_bridge_ros2dds-1]     zenoh_bridge_ros2dds --ros-localhost-only
[zenoh_bridge_ros2dds-1] 
[zenoh_bridge_ros2dds-1] For more information try --help
[ERROR] [zenoh_bridge_ros2dds-1]: process has died [pid 54, exit code 2, cmd '/opt/ros/overlay_ws/install/zenoh_bridge_ros2dds/lib/zenoh_bridge_ros2dds/zenoh_bridge_ros2dds --ros-args -r __node:=zenoh_bridge_ros2dds'].
[zenoh_bridge_ros2dds-1] 
```
