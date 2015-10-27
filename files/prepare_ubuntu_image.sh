#!/bin/bash

set -e

apt-get update

####################################################
#### Customize your docker image here. For more ####
#### inforation see https://docs.docker.com     ####
####################################################

# disable package installs
apt-get clean && rm -rf /var/lib/apt/lists
