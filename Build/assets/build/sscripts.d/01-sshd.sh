#!/bin/bash

echo "Initiate SSHD"

apt-get install -y --no-install-recommends openssh-server

chmod u+s /usr/sbin/sshd && mkdir /run/sshd 
 