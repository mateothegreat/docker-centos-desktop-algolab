#!/bin/bash

docker rmi -f appsoa/docker-centos-desktop-algolab:latest

docker build --force-rm --no-cache -t appsoa/docker-centos-desktop-algolab:latest . 

docker push appsoa/docker-centos-desktop-algolab:latest
