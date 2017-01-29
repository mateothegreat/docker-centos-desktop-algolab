#!/bin/bash
sleep 5
/home/user/Desktop/AlgoLab/AlgoLabOregon &

cd /home/user/noVNC
./utils/launch.sh --listen 6901 --vnc 127.0.0.1:5901 &