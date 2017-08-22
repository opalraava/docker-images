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

# enable X11
#RUN echo X11Forwarding yes >> /etc/ssh/sshd_config
#RUN echo X11UseLocalhost no >> /etc/ssh/sshd_config
#RUN dnf -y install xauth xterm

# install git
RUN dnf -y install git passwd

# create 'user' user (with 'user' password)
RUN adduser user
RUN echo "user" | passwd --stdin user
RUN chown -R user:user /home/user


# user commands
# RUN dnf -y install firefox emacs


EXPOSE 22

# init script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
CMD /docker-entrypoint.sh
