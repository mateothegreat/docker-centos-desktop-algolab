#!/bin/bash

DISPLAY=:1

(echo $CONF_VNC_PASS && echo $CONF_VNC_PASS) | vncpasswd

vncserver $DISPLAY -depth $VNC_COL_DEPTH -geometry $VNC_RESOLUTION -rfbport $CONF_VNC_PORT 



    