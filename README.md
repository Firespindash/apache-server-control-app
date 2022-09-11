# apache-server-control-app
A new blazing fast app to help you control the _Apache_ Server graphically on _Linux_.

![Default Theme App](apache-ctrl-kde-screenshot.png)

Apache Server Control Themed (ThemeSet: Akava-Kv, ThemeEngine: _Kvantum_, DE: _Kde_)
![Themed App](apache-ctrl-themed-screenshot.png)

Apache Server Control with Mini Terminal Open (ThemeSet: Akava-Kv, ThemeEngine: _Kvantum_, De: _Kde_)
![Terminal opened](apache-ctrl-terminal-screenshot.png)

This app was created to help web developers to increase their productivity when handling the server, allowing a simpler/faster control of the _Apache_ Server.

## Installation & Considerations
This program does not pre-install its dependencies. The dependencies are: _python3_, _PyQt5_, and _Apache_/_httpd_.
It comes with an cli installer to install it system-wide. To install you can type `./installer.sh` and to uninstall you can type `./installer.sh -u` in the terminal. \
You also have an option to run a headless mode by typing in terminal `apache-ctrl.sh` with one of the flags, that are `-i`, `-t`, `-e`, `-d` and `-h` for help. \
It is strongly recommended to have some previous knowledge about the _Apache_ Server before using this program. \
If you get any error, the mini in-app terminal will not be able to show what is happening, because it is a dumb one, to see better what is going on and to be able to see the logs from other programs, run in terminal by typing `apache-server-control`. \
Different parts of this project have different version numbers, but the overall version is 1.3, what is written inside the **apache-server-control.desktop** file. \
It has support for _systemd_ and _OpenRC_ init systems, and for _sudo_ and _doas_ privilige scalators. On the graphical mode, _pkexec_ is used for privilege scalations, which depends on a _polkit_ agent.
