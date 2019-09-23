#!/bin/sh
declare -i pn=1;

for i in $(seq 0 4); do
 for j in $(seq 0 9) A B; do
     if [ $pn -lt 58 ];then
	 devices=$(grep " $i$j  /device" all_2 | cut -d"/" -f9 | xargs);
	 echo creating zfs pool $pn with command "zpool create -f -O compression=off -O recordsize=4M -o ashift=12 -O atime=off -O xattr=off -O dedup=off -m /data/pool$pn pool$pn raidz2 $devices"
	 pn=pn+1;
     fi
 done;
done
