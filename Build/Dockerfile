FROM debian:stable-slim

LABEL version="1.0"
LABEL description="Docker image for docker development"


ARG DEVEL_UID
ARG DEVEL_USER=devel
ARG STARTUP_CMD="bash -c 'sleep infinity'"


ENV DOCKER_USER=${DEVEL_USER}
ENV DOCKER_HOMEDIR=/home/${DEVEL_USER}

ENV LANG en_US.UTF-8


RUN useradd -ms /bin/bash -u "${DEVEL_UID}" -d "${DOCKER_HOMEDIR}" ${DOCKER_USER} \
    && apt-get update \
    && apt-get install -qy --no-install-recommends git-core build-essential cmake autoconf automake libtool pkg-config \
         libglib2.0-dev libzip-dev libudev-dev libusb-1.0-0-dev \
         python3-dev qt5-default libboost-dev libboost-test-dev libboost-thread-dev libboost-system-dev libboost-filesystem-dev check libfftw3-dev



VOLUME [ "${DOCKER_HOMEDIR}", "/mnt/vhome" ]


USER ${DOCKER_USER}
WORKDIR ${DOCKER_HOMEDIR}

CMD ${STARTUP_CMD}
