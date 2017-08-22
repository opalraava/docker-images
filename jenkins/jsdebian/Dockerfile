# https://hub.docker.com/_/debian/
FROM debian:jessie
MAINTAINER Opal Raava <opalraava@riseup.net>

# system update
RUN apt-get update && apt-get upgrade -y

# requirements: sshd
RUN apt-get -y install openssh-server openssh-client
RUN ssh-keygen -A
RUN sed -Ei "s/^PermitRootLogin.*/PermitRootLogin no/" /etc/ssh/sshd_config
RUN mkdir /var/run/sshd

# system and basic utilities
RUN apt-get -y install passwd


# debian: setup locales
# https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-docker-container
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

# setup jdk from jessie-backports
RUN echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y install -t jessie-backports openjdk-8-jdk

# create 'build' user
RUN useradd build
RUN echo "build\nbuild" | passwd build
RUN mkdir -p /home/build/.ssh
RUN touch /home/build/.ssh/authorized_keys
RUN chmod 755 /home/build/.ssh
RUN chmod 644 /home/build/.ssh/authorized_keys
COPY src /home/build/tests
RUN chown -R build:build /home/build


# c/c++ build environment
RUN apt-get -y install git make build-essential pkg-config autoconf automake libtool autoconf-archive gettext gcc g++

EXPOSE 22

# init script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
CMD /docker-entrypoint.sh
