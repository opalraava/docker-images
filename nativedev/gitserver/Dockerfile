# https://hub.docker.com/_/alpine/
FROM alpine:latest
MAINTAINER Opal Raava <opalraava@riseup.net>

# update system
RUN apk update && apk upgrade

# install all packages
RUN apk add openssh sudo vim

# initialize ssh
RUN ssh-keygen -A
RUN sed -Ei "s/^PermitRootLogin.*/PermitRootLogin no/" /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd
RUN echo -n "" > /etc/motd

# create non-privileged user
ENV username git
RUN echo "911conspiracy\n911conspiracy" | adduser -S -s /bin/sh $username
RUN addgroup $username && addgroup $username $username && chown -R $username:$username /home/$username
RUN echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers


# install git
RUN apk add git
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
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]



