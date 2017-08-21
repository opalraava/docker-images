# https://hub.docker.com/_/fedora/
FROM fedora:latest
MAINTAINER Opal Raava <opalraava@riseup.net>

# system update
RUN dnf -y update

# requirements: sshd
RUN dnf -y install openssh-server openssh-clients
RUN ssh-keygen -A
RUN sed -Ei "s/^PermitRootLogin.*/PermitRootLogin no/" /etc/ssh/sshd_config
RUN mkdir /var/run/sshd

# create 'build' user
RUN adduser build
RUN mkdir /home/build/.ssh
COPY authorized_keys /home/build/.ssh/authorized_keys
RUN chmod 755 /home/build/.ssh
RUN chmod 644 /home/build/.ssh/authorized_keys
COPY src /home/build/tests
RUN chown -R build:build /home/build

# c/c++ build environment
RUN dnf -y install git make autoconf automake libtool gcc g++
EXPOSE 22

# init script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
CMD /docker-entrypoint.sh
