#!/bin/bash
if [ "$(lsusb)" == "Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub" ]; then
  sudo /home/pi/hid.sh
  sudo chmod 777 /dev/hidg0
  /home/pi/mouse-move.sh &
fi
