#!/bin/bash

BASE_DIR=/home/user

if [ -n "$CONF_IB_GATEWAY" ]; then

    echo "[containerizing] Applying configuration value.."
    echo "[containerizing]  + CONF_IB_GATEWAY: $CONF_IB_GATEWAY"

    echo $CONF_IB_GATEWAY > /home/user/Desktop/AlgoLab/Prefs/hostsocketport

else

    echo "User variables not set for gateway config!"
    exit 1

fi