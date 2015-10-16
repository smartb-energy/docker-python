FROM ubuntu:14.04
#FROM phusion/baseimage  # use phusion/baseimage if you need service management
                         # and other full-OS-like features
MAINTAINER 'smartB Engineering'

# basic setup for ubuntu
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update

####################################################
#### Customize your docker image here. For more ####
#### inforation see https://docs.docker.com     ####
####################################################

# disable package installs
RUN apt-get clean && rm -rf /var/lib/apt/lists
