FROM ubuntu-upstart:14.04
RUN apt-get update
COPY files/prepare_image.sh /home/root/prepare_image.sh
RUN /bin/bash /home/root/prepare_image.sh
