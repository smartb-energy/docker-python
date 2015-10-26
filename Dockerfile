FROM ubuntu:14.04
# use phusion/baseimage if you need service management, etc.
#FROM phusion/baseimage

MAINTAINER 'smartB Engineering'

# basic setup for ubuntu
COPY files/prepare_ubuntu_image.sh /home/root/prepare_ubuntu_image.sh
RUN /bin/bash /home/root/prepare_ubuntu_image.sh
