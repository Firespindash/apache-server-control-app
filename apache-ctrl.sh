#!/bin/sh

# Author: Firespindash <firespindash@gmail.com>
# Date: Aug 3rd, 2020
# Version: 1.7

# A script to make a simple control interface for apache

if [ "$1" = '-h' ]
then
    echo <<EOF "Usage: $(basename $0) [OPTION]
A simple control interface for the Apache Server.

  -i    Iniate the service
  -t    Terminate the service
  -e    Enable autostart
  -d    Disable autostart
  -g    Run graphical app
  -h    Show this message"
EOF
    exit
fi

[ $(which /bin/sudo) ] && authenticator='sudo' ||
  { [ $(which /bin/doas) ] && authenticator='doas'; } ||
  { echo "Sudo/doas authenticator agent was not found, please install one."; exit; }

[ $(ls -l /bin/init | grep systemd | wc -l) != 0 ] &&
  listCommand='systemctl list-unit-files' ||
  { [ $(ls -l /bin/init | grep openrc | wc -l) != 0 ] && listCommand='rc-status'; }

ret=$($authenticator $listCommand | grep httpd | awk '{print $1}')

[ "$ret" = 'httpd.service' ] && module='httpd' || module='apache2'

if [ $(ls -l /bin/init | grep systemd | wc -l) != 0 ]
then
    statusCommand="systemctl status $module"
    startCommand="systemctl start $module"
    stopCommand="systemctl stop $module"
    enableCommand="systemctl enable $module"
    disableCommand="systemctl disable $module"

elif [ $(ls -l /bin/init | grep openrc | wc -l) != 0 ]
then
    statusCommand="rc-service $module status"
    startCommand="rc-service $module start"
    stopCommand="rc-service $module stop"
    enableCommand="rc-update add $module default"
    disableCommand="rc-update del $module default"
fi

status=$($authenticator $statusCommand | awk 'FNR == 3 {print $2,$3}')

# if program does not end if an error occurs
[ ! $? = 0 ] &&
  { echo "Your Apache module has a different name, please alter the script."; exit; }

# initiate
if [ "$1" = '-i' ]
then
    $authenticator $startCommand
    echo "Apache service has been started."
# terminate
elif [ "$1" = '-t' ]
then
    $authenticator $stopCommand
    echo "Apache service has been stopped."
# enable
elif [ "$1" = '-e' ]
then
    $authenticator $enableCommand
    echo "Apache service has been enabled."
# disable
elif [ "$1" = '-d' ]
then
    $authenticator $disableCommand
    echo "Apache service has been disabled."
# run graphical version
elif [ "$1" = '-g' ]
then
    apache-server-control
    echo "Graphical mode has been launched."

else
    echo "Please use one of the flags, the flags are '-i', '-t', '-e', '-d', '-g', or '-h'."
fi
