#!/bin/bash
#make a on boot cronjob with `chrontab -e`
# then paste at the bottom `@reboot /home/ubuntu/cabrillo_rov/misc/controller.sh`
#sudo pigpiod # put this line in a cronjob under root on boot or create a service
sleep 1
roscore &
cd cabrillo_rov/
catkin_make
source ./devel/setup.bash
sleep 5
roslaunch ./src/thrust/launch/joy.launch &
roslaunch ./src/sensors/launch/sensors.launch & 
