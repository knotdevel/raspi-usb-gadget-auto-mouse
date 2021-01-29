#!/bin/sh
while true
do
 sleep 120
 sudo echo -ne "\0\x01\0" > /dev/hidg0
 sudo echo -ne "\0\xff\0" > /dev/hidg0
done
