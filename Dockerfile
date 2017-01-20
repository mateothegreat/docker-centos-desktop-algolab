#
#
FROM gcr.io/virtualmachines-154415/docker-centos-desktop-vnc:1.0.0

USER root

COPY src/home /home
# COPY src/etc /etc

RUN yum -y install nc telnet nmap tcpdump

EXPOSE 4100 5901 4440

COPY src/entrypoint.sh /
COPY src/entrypoint.d/* /entrypoint.d/
ONBUILD COPY src/entrypoint.d/* /entrypoint.d/


ADD https://storage.googleapis.com/algolab-container-resources/AlgoLabLinux64.zip /home/user/Desktop/AlgoLabLinux64.zip
RUN unzip -q /home/user/Desktop/AlgoLabLinux64.zip -d /home/user/Desktop && \
    mv /home/user/Desktop/AlgoLabLinux64 /home/user/Desktop/AlgoLab
RUN chown -R user:wheel /home/user

USER user
ENTRYPOINT ["/entrypoint.sh"]