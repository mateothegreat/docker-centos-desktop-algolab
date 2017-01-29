#!/bin/bash

DISPLAY=:1

# VNC_PW=algolab2017
# VNC_IP=$(ip addr show eth0 | grep -Po 'inet \K[\d.]+')
# VNC_PORT=$CONF_VNC_PORT
# NO_VNC_PORT=$CONF_NOVNC_PORT

(echo $CONF_VNC_PASS && echo $CONF_VNC_PASS) | vncpasswd
vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION

# cd /home/user/noVNC
# ./utils/launch.sh --listen 6901 --vnc 127.0.0.1:5901 &