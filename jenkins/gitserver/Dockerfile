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

# install git
RUN dnf -y install git passwd

# create 'git' user (with 'git' password)
RUN adduser git
RUN echo "git" | passwd --stdin git
RUN chown -R git:git /home/git

#WORKDIR /home/git
#RUN git init --bare hello.git && chown -R git:git hello.git
#COPY src /home/build/tests

VOLUME /home/git
EXPOSE 22

# init script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
CMD /docker-entrypoint.sh
