#!/bin/sh                                                                                                                                                                                                                                                      
declare -i pn=1;

for i in $(seq 0 4); do
 for j in $(seq 0 9) A B; do
     devices=$(grep " $i$j  /device" all_1 | cut -d"/" -f9 | xargs);
     if [ ! -z "$devices" ];then
         echo creating zfs pool $pn with devices: $devices;
         pn=pn+1;
     fi
 done;
done
