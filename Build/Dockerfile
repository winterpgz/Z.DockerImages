FROM ubuntu:20.04

ARG ARG_USER=devel
ARG ARG_UID=10000
#ARG ARG_GID=10000
#ARG C_HOME=/home/devel


RUN apt-get update \
    && apt-get install -y --no-install-recommends curl nano openssh-server sudo xterm \ 
    && echo -e "APT::Install-Suggests \"0\";\n APT::Install-Recommends \"0\";" > /etc/apt/apt.conf.d/90-noextra \
    && useradd --uid $ARG_UID -G sudo -m -d /home/$ARG_USER -s /bin/bash devel \
    && echo "${ARG_USER}:p@ssw0rd" | chpasswd && chage -d 0 $ARG_USER \
    && mkdir -p /etc/sudoers.d/ \
    && echo "$ARG_USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$ARG_USER && chmod 0440 /etc/sudoers.d/devel \
    && echo "Services init" \
    && chmod u+s /usr/sbin/sshd && mkdir /run/sshd 


EXPOSE 22

ENV HOME /home/$ARG_USER

USER $ARG_USER
WORKDIR /home/$ARG_USER

CMD ["/usr/sbin/sshd", "-D"]
