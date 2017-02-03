#!/bin/bash

# ENV CONF_API_PORT=4444
# ENV CONF_TRADING_MODE=paper
# ENV CONF_IB_USER=greg2017
# ENV CONF_IB_PASS=alglab111
# ENV CONF_IB_READ_ONLY=no

docker rm -f algolab

docker run -id  -e CONF_VNC_PASS=algolab2017 \
                -e CONF_CONTROLLER_PORT=4440 \
                -e CONF_API_PORT=4100 \
                -e CONF_TRADING_MODE=paper \
                -e CONF_IB_USER=alglab333 \
                -e CONF_IB_PASS=greg2017 \
                -e CONF_IB_GATEWAY=127.0.0.1:4100 \
                -e CONF_VNC_HTTP_PORT=6901 \
                -e CONF_VNC_PORT=5901 \
                -e CONF_VNC_REMOTE=127.0.0.1:5901 \
                -p 6999:6901 \
                -p 5999:5901 \
                --name algolab \
                 appsoa/docker-centos-desktop-algolab:latest
