#!/usr/bin/env bash

vcs import src < wsugv_ros2.repos

rosdep install --from-paths src -i --rosdistro humble
