# https://hub.docker.com/_/fedora/
FROM fedora:24
MAINTAINER Opal Raava <opalraava@riseup.net>

# system update
RUN dnf -y update

# requirements: sshd
RUN dnf -y install openssh-server openssh-clients
RUN ssh-keygen -A
RUN sed -Ei "s/^PermitRootLogin.*/PermitRootLogin no/" /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd


# create user: variable $username (with "$username" password)
ENV username git

RUN adduser $username
RUN dnf -y install passwd
RUN echo "$username" | passwd --stdin $username
RUN chown -R $username:$username /home/$username
RUN chmod a+rx /home/$username

# setup sudo for $username
RUN dnf -y install sudo
RUN echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers



# install git
RUN dnf -y install git
# copy in some test repos
COPY sample_repos/jsbuildbasicc.git   /home/$username/jsbuildbasicc.git
COPY sample_repos/jsbuildtestc.git    /home/$username/jsbuildtestc.git
COPY sample_repos/jsbuildtestcxx.git  /home/$username/jsbuildtestcxx.git
RUN chown -R $username:$username /home/$username



VOLUME /home/$username
EXPOSE 22

# init script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
CMD /docker-entrypoint.sh
