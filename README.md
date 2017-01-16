# docker-centos-desktop-ibgateway

```

docker exec -it gateway /bin/bash

```

```

docker logs gateway -f --tail 100

```



```

[user@982de9fd3fd3 Desktop]$ ps aux|grep IBC
user       189  0.0  0.0   4348   608 ?        S    00:34   0:00 tail -f /home/user/IBController/Logs/README.txt /home/user/IBController/Logs/ibgateway.log
user       280  0.0  0.0  11632  1484 ?        S    00:35   0:00 /bin/bash /opt/IBController/Scripts/DisplayBannerAndLaunch.sh
user       285  0.0  0.0  11632  1588 ?        S    00:35   0:00 /bin/bash /opt/IBController/Scripts/IBController.sh 962 -g --tws-path=/home/user/Jts --tws-settings-path=/home/user/Jts --ibc-path=/opt/IBController --ibc-ini=/home/user/IBController/IBController.ini --user= --pw= --fix-user= --fix-pw= --java-path= --mode=paper
user       312  5.9  2.5 4445904 392348 ?      Sl   00:35   0:18 /usr/bin/java -cp /home/user/Jts/ibgateway/962/jars/jts4launch-962.jar:/home/user/Jts/ibgateway/962/jars/locales.jar:/home/user/Jts/ibgateway/962/jars/log4j-api-2.5.jar:/home/user/Jts/ibgateway/962/jars/log4j-core-2.5.jar:/home/user/Jts/ibgateway/962/jars/total-2015c.jar:/home/user/Jts/ibgateway/962/jars/twslaunch-962.jar:/home/user/Jts/ibgateway/962/jars/twslaunch-install4j-1.7.jar:/opt/IBController/IBController.jar -Xmx768m ibcontroller.IBGatewayController /home/user/IBController/IBController.ini paper
user       449  0.0  0.0  12464   968 pts/0    S+   00:40   0:00 grep --color=auto IBC
[user@982de9fd3fd3 Desktop]$ po

```