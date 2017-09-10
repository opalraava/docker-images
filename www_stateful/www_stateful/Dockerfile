# https://hub.docker.com/_/debian/
FROM debian:jessie
MAINTAINER Opal Raava <opalraava@riseup.net>

# system update
RUN apt-get update && apt-get upgrade -y

# requirements: sshd
RUN apt-get -y install openssh-server openssh-client
RUN ssh-keygen -A
RUN sed -Ei "s/^PermitRootLogin.*/PermitRootLogin no/" /etc/ssh/sshd_config
RUN echo "X11Forwarding yes" >> /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd

# debian: setup locales
# https://stackoverflow.com/questions/28405902/how-to-set-the-locale-inside-a-docker-container
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install locales
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8

# create user: variable $username (with "$username" password)
ENV username user

RUN useradd $username
RUN apt-get -y install passwd
RUN echo "$username\n$username" | passwd $username
RUN mkdir -p /home/$username/.ssh
RUN touch /home/$username/.ssh/authorized_keys
RUN chmod 755 /home/$username/.ssh
RUN chmod 644 /home/$username/.ssh/authorized_keys
RUN chown -R $username:$usnername /home/$username


# email clients...
RUN apt-get -y install gnupg elinks screen xauth xterm firefox-esr

VOLUME /home/$username
EXPOSE 22

# init script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/sshd","-D"]
