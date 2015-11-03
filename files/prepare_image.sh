#!/bin/bash

set -e

# deps
apt-get install -y \
  gcc \
	python2.7-dev \
	libffi-dev \
	libpng12-dev \
  libfreetype6-dev \
  libblas-dev \
  liblapack-dev \
  libatlas-base-dev \
  gfortran \
  libpq-dev \
  python-pip

pip install -U pip

apt-get clean
