#!/bin/bash

if [ $UID == 0 ]
then
	echo "Please don't run this program as root user."
else
	if [ $1 == '-i' ] 2> /dev/null
	then
		mkdir /home/$USER/.apache-server-ctrl
		cp -r assets /home/$USER/.apache-server-ctrl
		cp apache-ctrl.py main_rc.py /home/$USER/.apache-server-ctrl 
		sudo cp apache-server-control apache-ctrl.sh /usr/bin
		cp *.png /home/$USER/.apache-server-ctrl

		echo '[Desktop Entry]' > apache-server-control.desktop
		echo 'Version=1.2' >> apache-server-control.desktop
		echo "Exec=apache-server-control" >> apache-server-control.desktop
		echo "Icon=/home/$USER/python/assets/logo-icon.png" >> apache-server-control.desktop
		echo 'Name=Apache Server Control' >> apache-server-control.desktop
		echo 'Comment=A new blazing-fast app to control Apache Server.' >> apache-server-control.desktop
		echo 'Encoding=UTF-8' >> apache-server-control.desktop
		echo 'Terminal=false' >> apache-server-control.desktop
		echo 'Type=Application' >> apache-server-control.desktop
		echo 'Categories=Application; Utility' >> apache-server-control.desktop

		chmod +x apache-server-control.desktop
		sudo cp apache-server-control.desktop /usr/share/applications

		echo "ApacheServerControl has been installed."
		
	elif [ $1 == '-u' ] 2> /dev/null
	then
		rm -rf /home/$USER/.apache-server-ctrl
		sudo rm /usr/bin/apache-server-control /usr/bin/apache-ctrl.sh /usr/share/applications/apache-server-control.desktop
		echo "ApacheServerControl has been uninstalled."
	else
		echo "Please use one of the flags (-i or -u)."
	fi
fi

