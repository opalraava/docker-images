# https://hub.docker.com/_/alpine/
FROM alpine:latest
MAINTAINER Opal Raava <opalraava@riseup.net>

# update system
RUN apk update && apk upgrade

# install all packages
RUN apk add openssh sudo vim
#RUN rm -rf /tmp/* /var/cache/apk/*

# initialize ssh
RUN ssh-keygen -A
RUN sed -Ei "s/^PermitRootLogin.*/PermitRootLogin no/" /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd
RUN echo -n "" > /etc/motd

# create non-privileged user
ENV username user
RUN echo "911conspiricy\n911conspiricy" | adduser -S -s /bin/sh $username
RUN addgroup $username && addgroup $username $username && chown -R $username:$username /home/$username
RUN echo "$username ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

EXPOSE 22

# init script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]
