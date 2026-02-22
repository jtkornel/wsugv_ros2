# Modified Waveshare UGV Rover with ROS2 support
This the top-level repository for a mobile robot based on the [Waveshare UGV Rover](https://www.waveshare.com/ugv-rover.htm), including some modifications to use the [RPLidar A1](https://www.slamtec.com/en/lidar/a1) for odometry and indoor navigation.

An important motivation for the project has been to use the UGV to automate photogrammetry image capture for environments and objects. This is work in progress, but the project has already much working functionality.

The project encompasses a [ROS2 driver](https://github.com/jtkornel/wsugv_protocol) written in Rust, as well as standard robot support packages for ROS2, in addition to this top-level workspace. The construction of this packages structure has been much easier through the use of the [ROS-Team-Workspace framework](https://rtw.b-robotized.com/master/index.html) from Karlsruhe Institute of Technology (KIT) and Stogl Robotics.

NOTE: This is an independent open-source project, not officially endorsed or supported by Waveshare.

## Status
* Communication with UGV Rover base unit for controlling the motors and reading sensor data: [wsugv_protocol package](https://github.com/jtkornel/wsugv_protocol).
  * `/cmd_vel` high-level control messages for rotation and velocity. The base units runs a differential drive controller for the wheels.
  * `/imu` for accelerometer data and `joint_states` for the wheel position feedback.
* URDF robot description files for the modified Rover UGV with LIDAR: [wsugv_description package](https://github.com/jtkornel/wsugv_description).
* Launch scripts for the robot itself and supporting remote node: [wsugv_bringup package](https://github.com/jtkornel/wsugv_bringup)
  * Includes bringup script for nav2 and remote operation intended to run on a more powerful supporting computer
