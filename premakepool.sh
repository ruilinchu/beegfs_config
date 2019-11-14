#!/bin/sh
#set -x

for i in `lsblk | grep disk | grep "1.8T" | awk '{print $1}'`; do 
  echo /sys/class/enclosure/*/*/device/block/$i
done > all

for enc in `ls /sys/class/enclosure`; do
for i in $(seq 0 4); do
 for j in $(seq 0 9) A B; do
	 device=$(cat all |grep " $i$j  /device"| grep "$enc" | cut -d"/" -f9);
	 echo $device
 done | xargs
done > disk.`echo $enc|tr ":" "_"`
done
