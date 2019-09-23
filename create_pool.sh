#!/bin/sh
declare -i pn=1;

for i in $(seq 0 4); do
 for j in $(seq 0 9) A B; do
     if [ $pn -lt 58 ];then
	 devices=$(grep " $i$j  /device" all_2 | cut -d"/" -f9 | xargs);
	 echo creating zfs pool $pn with devices: $devices;
	 pn=pn+1;
     fi
 done;
done
