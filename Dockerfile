#
#
FROM appsoa/docker-centos-desktop-vnc:latest
MAINTAINER Matthew Davis <matthew@appsoa.io>

USER root

ENV INSTALL4J_JAVA_HOME=/usr/java/jdk1.8.0_60 \
    TZ=America/Phoenix

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

COPY src/home /home
# COPY src/etc /etc

RUN yum -y install nc telnet nmap tcpdump roboto-fontface-fonts google-noto-sans-fonts

EXPOSE 4100 5901 4440

COPY src/entrypoint.sh /
COPY src/entrypoint.d/* /entrypoint.d/
ONBUILD COPY src/entrypoint.d/* /entrypoint.d/

ADD https://storage.googleapis.com/algolab-assets-bucket/AlgoLabLinux64.zip /home/user/Desktop/AlgoLabLinux64.zip
RUN unzip -q /home/user/Desktop/AlgoLabLinux64.zip -d /home/user/Desktop && \
    mv /home/user/Desktop/AlgoLabLinux64 /home/user/Desktop/AlgoLab
RUN chown -R user:wheel /home/user

USER user
ENTRYPOINT ["/entrypoint.sh"]