#!/bin/sh

BUILDUSER="mingxing"

echo "cp login_bjut.sh"
sudo cp /home/desc/login_bjut.sh /home/${BUILDUSER}/login_bjut.sh
sudo chown -R ${BUILDUSER}:${BUILDUSER} login_bjut.sh

echo "cp Anaconda3"
sudo cp /home/desc/Downloads/Anaconda3-2022.05-Linux-x86_64.sh /home/${BUILDUSER}/
sudo chown -R ${BUILDUSER}:${BUILDUSER} Anaconda3-2022.05-Linux-x86_64.sh


echo "disk mkdir"
sudo mkdir /mnt/disk1/${BUILDUSER}
sudo chown -R ${BUILDUSER}:${BUILDUSER} /mnt/disk1/${BUILDUSER}

echo "ln -s dir"
ln -s /mnt/disk1/${BUILDUSER} /home/${BUILDUSER}/data



