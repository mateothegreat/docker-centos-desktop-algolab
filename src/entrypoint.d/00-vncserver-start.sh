#!/bin/bash
DISPLAY=:1
/bin/vncserver-ctl.sh
# ./utils/launch.sh --listen $CONF_VNC_HTTP_PORT --vnc $CONF_VNC_REMOTE
cd /home/user/noVNC
./utils/launch.sh --listen 6901 --vnc 127.0.0.1:5901 &