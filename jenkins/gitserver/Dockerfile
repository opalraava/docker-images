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

# copy in some test repos
#COPY repos /home/git/
COPY repos/jsbuildbasicc.git /home/git/jsbuildbasicc.git
COPY repos/jsbuildtestc.git /home/git/jsbuildtestc.git
COPY repos/jsbuildtestcxx.git /home/git/jsbuildtestcxx.git

EXPOSE 22

# init script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
CMD /docker-entrypoint.sh
