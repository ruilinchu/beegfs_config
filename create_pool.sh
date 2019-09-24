#!/bin/sh

for i in `lsblk | grep disk | grep "1.8T" | awk '{print $1}'`; do 
  path=$(echo /sys/class/enclosure/*/*/device/block/$i);
  echo $path /wwn-0x$(cat "$path/../../wwid"|cut -d"." -f2); 
done > all
## give out enclosure, slot position, device label, serial number used by zpool
## /sys/class/enclosure/10:0:62:0/SLOT 1 00 /device/block/sdte / wwn-0x5000cca222f39497

declare -i pn=1;

for i in $(seq 0 4); do
 for j in $(seq 0 9) A B; do
     if [ $pn -lt 58 ];then
	 devices=$(grep "$i$j /device/block" all | cut -d"/" -f9 | xargs);
	 if (( $pn % 2 )); then
	     echo  "zpool create -f -O compression=off -O recordsize=4M -o ashift=12 -O atime=off -O xattr=off -O dedup=off -m /data/pool-$pn pool-$pn raidz2 $devices" >> command_1.sh;
	 else
	     echo  "zpool create -f -O compression=off -O recordsize=4M -o ashift=12 -O atime=off -O xattr=off -O dedup=off -m /data/pool-$pn pool-$pn raidz2 $devices" >> command_2.sh;
	 fi
	 pn=pn+1;
     fi
 done;
done
