# https://hub.docker.com/_/fedora/
FROM fedora:latest
MAINTAINER Opal Raava <opalraava@riseup.net>

# system update
RUN dnf -y update

# requirements: sshd
RUN dnf -y install openssh-server openssh-clients vi vim
RUN ssh-keygen -A
RUN sed -Ei "s/^PermitRootLogin.*/PermitRootLogin no/" /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd

# create user: variable $username (with "$username" password)
ENV username user

RUN adduser $username
RUN dnf -y install passwd
RUN echo "$username" | passwd --stdin $username
RUN chown -R $username:$username /home/$username

# setup sudo for $username
RUN dnf -y install sudo
RUN echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers



# console commands: basic
RUN dnf -y install screen irssi links mc wget mutt gnupg2 zip unzip procps-ng

# networking commands: ip networking and internet
RUN dnf -y install iputils net-tools hostname traceroute nmap

# coding commands: c/c++
RUN dnf -y install git tig make autoconf automake libtool gettext gcc gcc-c++ gdb flex bison mysql
RUN dnf -y install mariadb-devel

# coding commands: java
RUN dnf -y install java-1.8.0-openjdk-devel maven




# enable X11
RUN dnf -y install xauth xterm gvim

# X11 commands: basic
RUN dnf -y install keepassx emacs firefox thunderbird chromium xpdf gimp retext
# X11 commands: coding
RUN dnf -y install gitk ddd glx-utils glade



# trick to get access to my own docker config...
RUN mkdir -p /var/parent
VOLUME /var/parent

VOLUME /home/$username
EXPOSE 22

# init script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
CMD /docker-entrypoint.sh
