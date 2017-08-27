FROM finalduty/archlinux:weekly
MAINTAINER Opal Raava <opalraava@riseup.net>

# system update
RUN pacman -Syu --noconfirm

# requirements: sshd
RUN pacman -Syu --noconfirm openssh vi vim
RUN ssh-keygen -A
RUN sed -Ei "s/^PermitRootLogin.*/PermitRootLogin no/" /etc/ssh/sshd_config
RUN echo "X11Forwarding yes" >> /etc/ssh/sshd_config
RUN mkdir -p /var/run/sshd

# Create an unprivileged user; grant user guest sudo rights
RUN pacman -Syu --noconfirm sudo
ENV username user
RUN useradd -m $username && echo "$username ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/00-allowed
#RUN echo "$username\n$username" | passwd $username
RUN mkdir -p /home/$username
RUN chown -R $username:$username /home/$username
RUN chmod a+rx /home/$username

# Install blackarch repos... (OFFICIAL STEPS)
#RUN curl -O https://blackarch.org/strap.sh
#RUN chmod +x strap.sh
#RUN ./strap.sh

# blackarch: this one works, found here: https://github.com/BlackArch/blackarch-site/pull/72
RUN curl -O https://raw.githubusercontent.com/PedroSFreitas/blackarch-site/strap-sh-patch/strap.sh
RUN chmod +x strap.sh
RUN ./strap.sh


#
# Install base-devel
#RUN pacman -S --needed --noprogressbar --noconfirm base-devel git; pacman -Scc --noprogressbar --noconfirm
#RUN pacman -Syu --noconfirm vim
#

RUN pacman -Syu --noconfirm screen irssi links mc wget mutt zip unzip

# X11
RUN pacman -Syu --noconfirm xorg-xauth xorg-xhost xterm





VOLUME /home/$username
EXPOSE 22

# init script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
CMD /docker-entrypoint.sh
