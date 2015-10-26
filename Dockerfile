FROM ubuntu:14.04
#FROM phusion/baseimage  # use phusion/baseimage if you need service management
                         # and other full-OS-like features
MAINTAINER 'smartB Engineering'

# basic setup for ubuntu
COPY files/prepare_ubuntu_image.sh /home/root/prepare_ubuntu_image.sh
RUN /bin/bash /home/root/prepare_ubuntu_image.sh
