#!/bin/bash

set -e

# basic setup for ubuntu
dpkg-divert --local --rename --add /sbin/initctl
ln -sf /bin/true /sbin/initctl
apt-get update

####################################################
#### Customize your docker image here. For more ####
#### inforation see https://docs.docker.com     ####
####################################################

# disable package installs
apt-get clean && rm -rf /var/lib/apt/lists
