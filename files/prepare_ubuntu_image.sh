#!/bin/bash

set -e
apt-get update
apt-get upgrade -y gcc

#deps



apt-get -qq -y install curl
#install and up pip
apt-get install -y python-pip
pip install -U pip
apt-get update
cd /home/root/
pip install $(cat requirements.txt | grep numpy)
pip install -r requirements.txt

apt-get clean
