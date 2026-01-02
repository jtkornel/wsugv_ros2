#!/usr/bin/env bash

# For compatibility with older CMake versions required by ROS1
export CMAKE_POLICY_VERSION_MINIMUM=3.5
colcon build --symlink-install
