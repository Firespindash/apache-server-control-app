#!/bin/bash

# Author: Firespindash <firespindash@gmail.com>
# Date: Aug 3rd, 2020
# Version: 1.4

# A script to make a simple control interface for apache

ret=$(sudo systemctl list-unit-files | grep httpd | awk '{print $1}')

if [ "$ret" == "httpd.service" ]
then
	module='httpd'
else
	module='apache2'
fi

status=$(sudo systemctl status $module | awk 'FNR == 3 {print $2,$3}')

# if program does not end if an error occurs
if [ ! $? == 0 ]
then
	echo "Your Apache module has a different name, the script will not work."
	exit
fi

# init
if [ "$1" == '-i' ]
then
	if [ "$status" == "inactive (dead)" ]
	then
		sudo systemctl start $module
		echo "Apache.service has been started."
	fi
# terminate
elif [ "$1" == '-t' ]
then
	if [ "$status" == "active (running)" ]
	then
		sudo systemctl stop $module
		echo "Apache.service has been stopped."
	fi
# enable
elif [ "$1" == '-e' ]
then
	sudo systemctl enable $module
	echo "Apache.service has been enabled."
# disable
elif [ "$1" == '-d' ]
then
	sudo systemctl disable $module
	echo "Apache.service has been disabled."
# run graphical interface version
elif [ "$1" == '-g' ]
then
	apache-server-control
	echo "Graphical mode has been launched."
else
	echo "Please uuse one of the flags, the flags are '-i', '-t', '-e', '-d', '-g'."
fi
