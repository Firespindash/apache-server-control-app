#!/bin/sh

if [ $(id -u) = 0 ]
then
    echo "Please don't run this program as root user."
else
    [ $(which /bin/sudo) ] && authenticator='sudo' ||
      { [ $(which /bin/doas) ] && authenticator='doas'; } ||
      { echo "Sudo/doas authenticator agent was not found, please install one."; exit; }	

    [ "$1" ] && flag="$1" || flag='-i'

    if [ "$flag" = '-i' ]
    then
        $authenticator mkdir /usr/local/share/apache-server-ctrl
        $authenticator cp -r assets /usr/local/share/apache-server-ctrl
        $authenticator cp apache-ctrl.py main_rc.py /usr/local/share/apache-server-ctrl 
        $authenticator cp apache-server-control apache-ctrl.sh /usr/local/bin

        echo '[Desktop Entry]' > apache-server-control.desktop
        echo 'Version=1.3' >> apache-server-control.desktop
        echo "Exec=/usr/bin/apache-server-control" >> apache-server-control.desktop
        echo "Icon=/usr/local/share/apache-server-ctrl/assets/logo-icon.png" >> apache-server-control.desktop
        echo 'Name=Apache Server Control' >> apache-server-control.desktop
        echo 'Comment=A new blazing fast app to control the Apache Server.' >> apache-server-control.desktop
        echo 'Encoding=UTF-8' >> apache-server-control.desktop
        echo 'Terminal=false' >> apache-server-control.desktop
        echo 'Type=Application' >> apache-server-control.desktop
        echo 'Categories=Application; Utility' >> apache-server-control.desktop

        chmod +x apache-server-control.desktop
        $authenticator mv apache-server-control.desktop /usr/share/applications

        echo "ApacheServerControl has been installed."

    elif [ "$flag" = '-u' ]
    then
        $authenticator rm -rf /usr/local/share/apache-server-ctrl
        $authenticator rm /usr/local/bin/apache-server-control /usr/local/bin/apache-ctrl.sh /usr/share/applications/apache-server-control.desktop
        echo "ApacheServerControl has been uninstalled."
    else
        echo "Please use one of the valid flags (-i or -u)."
    fi
fi
