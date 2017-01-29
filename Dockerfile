#
#
# FROM centos:7
# FROM appsoa/docker-centos-desktop-vnc:latest
FROM appsoa/docker-centos-base-java:latest
MAINTAINER Matthew Davis <matthew@appsoa.io>

# ENV INSTALL4J_JAVA_HOME=/usr/java/jdk1.8.0_60 \
#     TZ=America/Phoenix

COPY src/home /home

RUN yum -y install wget unzip nc telnet nmap tcpdump roboto-fontface-fonts google-noto-sans-fonts

COPY src/entrypoint.sh /
COPY src/entrypoint.d/* /entrypoint.d/
ONBUILD COPY src/entrypoint.d/* /entrypoint.d/

# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
#     echo $TZ > /etc/timezone && \
#     # wget https://storage.googleapis.com/algolab-assets-bucket/AlgoLabLinux64.zip -O /home/user/Desktop/AlgoLabLinux64.zip && \
#     # unzip -o -q /home/user/Desktop/AlgoLabLinux64.zip -d /home/user/Desktop && \
#     mv /home/user/Desktop/AlgoLabLinux64 /home/user/Desktop/AlgoLab && \
#     chown -R user:wheel /home/user

EXPOSE 5901 6901

USER user
ENTRYPOINT ["/entrypoint.sh"]