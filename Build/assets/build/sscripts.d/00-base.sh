#!/bin/bash

apt-get update 

apt-get install -y --no-install-recommends curl ca-certificates nano sudo xterm


#echo -e "APT::Install-Suggests \"0\";\n APT::Install-Recommends \"0\";" > /etc/apt/apt.conf.d/90-noextra

groupadd -g ${ARG_UID} ${ARG_USER} \
    && useradd --uid ${ARG_UID} --gid ${ARG_UID} -G sudo -m -d /home/${ARG_USER} -s /bin/bash ${ARG_USER} \
    && echo "${ARG_USER}:p@ssw0rd" | chpasswd && chage -d 0 ${ARG_USER} \
    || exit 1


mkdir -p /etc/sudoers.d/ \
    && echo "$ARG_USER ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$ARG_USER && chmod 0440 /etc/sudoers.d/${ARG_USER}
