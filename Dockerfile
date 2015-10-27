FROM ubuntu-upstart:14.04
COPY files/prepare_ubuntu_image.sh /home/root/prepare_ubuntu_image.sh
RUN /bin/bash /home/root/prepare_ubuntu_image.sh
