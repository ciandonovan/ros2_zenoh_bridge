FROM ros:humble-ros-base
MAINTAINER Cian Donovan cian.donovan@akara.ai

ARG OVERLAY_WS=/opt/ros/overlay_ws
ENV OVERLAY_WS $OVERLAY_WS

# install base packages
#RUN apt-get update && apt-get install -y \
#	tini \
#	ros-$ROS_DISTRO-rmw-cyclonedds-cpp \
#	&& rm -rf /var/lib/apt/lists/*

# copy overlay source
WORKDIR $OVERLAY_WS
COPY src/ $OVERLAY_WS/src/

# install overlay dependencies
RUN . /opt/ros/$ROS_DISTRO/setup.sh \
	&& apt-get update \
	&& rosdep install --from-paths src --ignore-src -r -y \
	&& rm -rf /var/lib/apt/lists/*

# build overlay source
RUN . /opt/ros/$ROS_DISTRO/setup.sh \
	&& colcon build

# source overlay from entrypoint
RUN sed --in-place \
	's|^source .*|source "$OVERLAY_WS/install/setup.bash"|' \
	/ros_entrypoint.sh

# source ROS from .bashrc
RUN echo 'source "$OVERLAY_WS/install/setup.bash"' >> /root/.bashrc
