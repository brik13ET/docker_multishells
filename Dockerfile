FROM ubuntu:latest

RUN mkdir /data
RUN apt-get update \
    && apt-get install -y openssh-server gcc
RUN echo 'root:root' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -i 's/#PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN mkdir /var/run/sshd
RUN chmod 0755 /var/run/sshd

WORKDIR /data
EXPOSE 22
CMD ["/usr/sbin/sshd" ,"-D"]
