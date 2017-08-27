# https://hub.docker.com/_/fedora/
FROM fedora:latest
MAINTAINER Opal Raava <opalraava@riseup.net>

# system update
RUN dnf -y update

# requirements: sshd
RUN dnf -y install openssh-server openssh-clients
RUN ssh-keygen -A
RUN sed -Ei "s/^PermitRootLogin.*/PermitRootLogin no/" /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd

# create user: variable $username (with "$username" password)
ENV username build

RUN adduser $username
RUN dnf -y install passwd
RUN echo "$username" | passwd --stdin $username
RUN chown -R $username:$username /home/$username

# setup sudo for $username
RUN dnf -y install sudo
RUN echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers



# java for jenkins agent (required)
RUN dnf -y install java-1.8.0-openjdk-devel

# c/c++ build environment
RUN dnf -y install git make autoconf automake libtool gettext pkgconfig gcc gcc-c++ gdb flex bison mysql
RUN dnf -y install mariadb-devel



EXPOSE 22

# init script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
CMD /docker-entrypoint.sh
