# apache-server-control-app
A new blazing fast app to help you to control _Apache Server_ graphically on _Linux_.

![Default Theme App](apache-ctrl-kde-screenshot.png)

Apache Server Control Themed (ThemeSet: Akava-Kv, ThemeEngine: _Kvantum_, DE: _Kde_)
![Themed App](apache-ctrl-themed-screenshot.png)

Apache Server Control with Mini Terminal Open (ThemeSet: Akava-Kv, ThemeEngine: _Kvantum_, De: _Kde_)
![Terminal opened](apache-ctrl-terminal-screenshot.png)

This app was created to help webdevelopers to increase their production, and to help being faster to control Apache Server.
It's strongly recommended to already have some knowledge about Apache Server before using this program. \
If you get any error, the mini terminal in-app won't show what is happening, to see better what is going on and to be able to see the logs from other programs, run in terminal, by typing `apache-server-control`. \
This program doesn't pre-install its dependencies. The dependencies are _python3_, _PyQt5_, _apache/httpd_, and _systemd_.
Now there is an cli installer wizard to install it to be system-wide. To install you can type `./installer.sh -i` and to uninstall you can type `./installer.sh -u` in the terminal. \
You also have an option to run a headless mode by typing in terminal `apache-ctrl.sh` with one of the flags, that are `-i`, `-t`, `-e`, `-d` and `-h` for help.
The parts of this project have different version numbers, but the overall version is 1.2 and it is shown in the **apache-server-control.desktop** file.
