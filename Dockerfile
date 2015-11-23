FROM ubuntu-upstart:14.04

RUN apt-get update
RUN apt-get install -y \
	python2.7-dev \
	libffi-dev \
	libpng-dev \
    freetype* \
    libblas-dev \
    liblapack-dev \
    libatlas-base-dev \
    gfortran \
    libpq-dev
RUN apt-get build-dep -y python-tables
RUN apt-get install rsync
COPY files/ /home/root/
RUN /bin/bash /home/root/prepare_ubuntu_image.sh

