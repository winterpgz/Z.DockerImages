FROM debian:buster-slim


ARG ARG_USER=docker
ARG ARG_UID=10000
#ARG ARG_GID=10000
#ARG C_HOME=/home/devel


COPY assets/build /tmp/docker-image.build

RUN for f in /tmp/docker-image.build/scripts.d/*.sh; do bash "$f" || exit 1; done


EXPOSE 22

ENV HOME /home/$ARG_USER

USER $ARG_USER
WORKDIR /home/$ARG_USER

CMD ["/usr/sbin/sshd", "-D"]

