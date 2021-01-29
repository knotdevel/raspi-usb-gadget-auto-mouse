#!/bin/bash
set -ex
export LANG=C

# output filename
OUTPUT_IMAGE_BASE=usb-gadget-auto-mouse

# download filename/URL
DL_IMAGE_BASE=2021-01-11-raspios-buster-armhf-lite
DL_IMAGE_URL=https://downloads.raspberrypi.org/raspios_lite_armhf/images/raspios_lite_armhf-2021-01-12/${DL_IMAGE_BASE}.zip

# download raspi os lite img
if [ ! -f ${DL_IMAGE_BASE}.zip ]; then
	wget ${DL_IMAGE_URL}
fi

# extract img
if [ ! -f ${DL_IMAGE_BASE}.img ]; then
	unzip ${DL_IMAGE_BASE}.zip
fi

# rename img
rm -f ${OUTPUT_IMAGE_BASE}.img
cp ${DL_IMAGE_BASE}.img ${OUTPUT_IMAGE_BASE}.img

# check img
#fdisk -l ${OUTPUT_IMAGE_BASE}.img

# create loop device
LOOP=$(sudo losetup --show -fP ${OUTPUT_IMAGE_BASE}.img)

# check partitions
#cat /proc/partitions

# mount img
DST_DIR=rootfs
sudo mkdir -p ${DST_DIR}
sudo mount ${LOOP}p2 ${DST_DIR}
sudo mount ${LOOP}p1 ${DST_DIR}/boot

# check mounted dirs
#ls -al ${DST_DIR}
#ls -al ${DST_DIR}/boot/
#read -p "hit return:"

##############################################################################
# setup usb-gadget-auto-mouse [start]
##############################################################################

echo "dtoverlay=dwc2" | sudo tee -a ${DST_DIR}/boot/config.txt
echo "dwc2"           | sudo tee -a ${DST_DIR}/etc/modules

sudo cp rc.local      ${DST_DIR}/etc/
sudo cp enableHid.sh  ${DST_DIR}/home/pi/
sudo cp hid.sh        ${DST_DIR}/home/pi/
sudo cp mouse-move.sh ${DST_DIR}/home/pi/

sudo chown 1000:1000  ${DST_DIR}/home/pi/enableHid.sh
sudo chown 1000:1000  ${DST_DIR}/home/pi/hid.sh
sudo chown 1000:1000  ${DST_DIR}/home/pi/mouse-move.sh

##############################################################################
# setup usb-gadget-auto-mouse [end]
##############################################################################

# wait
sync; sync; sync; sleep 1

# umount
sudo umount ${LOOP}p1
sudo umount ${LOOP}p2
sudo umount ${LOOP}p? || true

# delete loop device
sudo losetup -d ${LOOP}

# rm mountpoint
sudo rm -rf ${DST_DIR}


echo "Write img to sdcard with below command:"
echo "$ sudo dd if=usb-gadget-auto-mouse.img of=/dev/mmcblk0 bs=1M conv=fsync"
# finished
echo Finished $0



#function cleanup {
#	sudo umount ${LOOP}p1 || true
#	sudo umount ${LOOP}p2 || true
#	sudo umount ${LOOP}p? || true
#	sudo losetup -d ${LOOP}
#	sync
#	sudo rm -rf ${DST_DIR}
#}
#trap cleanup EXIT
