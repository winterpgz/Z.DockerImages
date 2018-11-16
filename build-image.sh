#!/bin/bash

echo "please input the name of docker image":
read NAME

echo "Please input the username mapped into container: (default to current user)"
read devel_user

if [ -z "${devel_user}" ]; then
    devel_uid="$(id -u)"
    devel_user="${USER}"
else
    if ! id -u "${devel_user}" 2>/dev/null; then
        echo "Cannot find the user ${devel_user}"
        exit 1
    fi
    devel_uid=$(id -u ${devel_user})
fi

cd Build && docker build -t $NAME --build-arg DEVEL_UID=${devel_uid} --build-arg DEVEL_USER=${devel_user} --force-rm=true  . #--squash

