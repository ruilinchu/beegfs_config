#!/bin/sh                                                                                                                                                                                                                                                      
declare -i pn=1;

for i in 0; do
 for j in $(seq 0 9) A B; do
     devices=$(grep " $i$j  /device" all_1 | cut -d"/" -f9 | xargs);
     echo creating zfs pool $pn with devices: $devices;
     pn=pn+1;
 done;
done

