FROM ubuntu-upstart:14.04

RUN apt-get update

RUN apt-get upgrade -y gcc
RUN apt-get install --no-install-recommends -y python2.7-dev libffi-dev libpng-dev libblas-dev liblapack-dev libatlas-base-dev gfortran libpq-dev curl python-pip rsync libfreetype6-dev
RUN apt-get build-dep -y python-tables
RUN apt-get clean

RUN pip install -U pip

COPY files/ /home/root/
RUN cd /home/root/ && pip install $(cat requirements.txt | grep numpy)
RUN cd /home/root/ && pip install -r requirements.txt
