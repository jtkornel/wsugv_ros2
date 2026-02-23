<img width="853" height="683" alt="modified_UGV_rover_rendering_overview" src="https://github.com/user-attachments/assets/c496e6e2-4724-4971-b511-cc092211025d" />

# Modified Waveshare UGV Rover with ROS2 support

This the ROS2 workspace repository for a mobile robot based on the [Waveshare UGV Rover](https://www.waveshare.com/ugv-rover.htm), including some modifications to use the [RPLidar A1](https://www.slamtec.com/en/lidar/a1) for odometry and indoor navigation.

An important motivation for the project has been to use the UGV to automate photogrammetry image capture for environments and objects. This is work in progress, but the project has already much working functionality.

The project encompasses a [ROS2 driver](https://github.com/jtkornel/wsugv_protocol) written in Rust, as well as standard robot support packages for ROS2, in addition to this top-level workspace. The construction of this packages structure has been much easier through the use of the [ROS-Team-Workspace framework](https://rtw.b-robotized.com/master/index.html) from Karlsruhe Institute of Technology (KIT) and Stogl Robotics.

NOTE: This is an independent open-source project, not officially endorsed or supported by Waveshare.

## Status
### Completed
* Communication with UGV Rover base unit for controlling the motors and reading sensor data: [wsugv_protocol package](https://github.com/jtkornel/wsugv_protocol).
  * `/cmd_vel` high-level control messages for rotation and velocity. The base units runs a differential drive controller for the wheels.
  * `/imu` for accelerometer data and `joint_states` for the wheel position feedback.
* URDF robot description files for the modified Rover UGV with RPLidar A1 and custom mounting plate: [wsugv_description package](https://github.com/jtkornel/wsugv_description).
  * This allows visualizing the robot in RViz when operating (with a simplified geometry).
* Launch scripts for the robot itself and supporting remote node: [wsugv_bringup package](https://github.com/jtkornel/wsugv_bringup)
  * Includes bringup script for nav2 and remote operation intended to run on a more powerful supporting computer
  * Brings up lidar-based odometry for now
* Workspace bringing the parts together, with some convenience scripts for fetching dependencies and building (which is what you are looking at now).
* [Lidar mounting plate](https://github.com/jtkornel/wsugv_ros2/blob/main/cad_models/UGV_Rover_lidar_mounting_plate.step) which can be 3D printed.
### To be done
* Improved sensor fusion for odometry
  * IMU calibration. The default setup gives a lot of drift which is probably not unexpected. Both the on-chip calibration or some external toolbox could be options.
  * Odometry from wheels
  * Configuration of robot-localization toolbox for fusion
* Further configuration and tuning of the Nav2 stack
* Nav2 behaviour tree for image capture ?
* A better camera and possibly some calibration of it
* Some collision sensors closer to ground-level than the LIDAR

## Requirements for use
* [Waveshare UGV Rover](https://www.waveshare.com/ugv-rover.htm) with installed Raspberry PI 4 or 5.
* [RPLidar A1](https://www.slamtec.com/en/lidar/a1) connected to USB and mounted to the UGV like shown in the image above. Here is a [CAD model](https://github.com/jtkornel/wsugv_ros2/blob/main/cad_models/UGV_Rover_lidar_mounting_plate.step) for a custom mounting plate you may use, as the original mounting plate provided with the Rover does not fit this lidar unit.
* An installation of [ROS 2 Humble](https://index.ros.org/doc/ros2/Installation/Humble/Linux-Install-Debians/) on the RPI and optionally installed on a supporting computer for remote operation and navigation. The RPI and supporting computer must be connected to the same local network (for ROS2 DDS network traffic).

## Building and installing

After you have cloned this repository, you can download and build dependencies using the provided scripts:
```
source /opt/ros/humble/setup.bash
# Clones dependent repos from wsugv_ros2.repos and installs dependencies
./install_all.sh
./build_all.sh
source setup_env.sh
```

For subsequent sessions the last step is sufficent to use the packages:
```
source setup_env.sh
```





