#!/bin/bash
#make a on boot cronjob with `chrontab -e`
# then paste at the bottom `@reboot /home/ubuntu/cabrillo_rov/misc/shore.sh`
source /opt/ros/noetic/setup.bash
cd cabrillo_rov/
git pull    # Comment out for quicker rov startup
catkin_make # Comment out for quicker rov startup
source ./devel/setup.bash
export ROS_MASTER_URI=http://$(getent hosts earle-s1.local | cut -d " " -f1):11311
sleep 1
roslaunch ./launch/shore.launch