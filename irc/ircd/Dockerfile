# https://hub.docker.com/_/alpine/
FROM alpine:latest
MAINTAINER Opal Raava <opalraava@riseup.net>

# update system
RUN apk update && apk upgrade

RUN apk add ngircd
COPY ngircd.conf /etc/ngircd/ngircd.conf
COPY ngircd.motd /etc/ngircd/ngircd.motd

EXPOSE 6667

# init script
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/ngircd","--nodaemon","--passive"]
