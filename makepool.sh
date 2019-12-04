#!/bin/sh
#set -x
#
# this is for a 60 tray 5rowx12col JBOD enclosure, 2col=1vdev, 3vdev=1pool=30HDD
#

declare -a c
declare -a d
read -r o1 o2 <<< $(ls /sys/class/enclosure/ | tr ":" "_"| xargs)

for i in `seq 1 12`; do
    c[$i]=`cat disk.$o1 | cut -d " " -f $i | xargs`
    d[$i]=`cat disk.$o2 | cut -d " " -f $i | xargs`
done

echo ${c[12]}
echo ${d[11]}
#2x multipath, using only c for pool creation, followed by export and zpool import -d /dev/mapper -a

zpool create -f -O compression=lz4 -O recordsize=4M -o ashift=12 -O atime=off -O xattr=off -O dedup=off -m /data/pool-1 \
    pool-1 raidz2 ${c[1]} ${c[2]} \
    raidz2 ${c[3]} ${c[4]} \
    raidz2 ${c[5]} ${c[6]}

zpool create -f -O compression=lz4 -O recordsize=4M -o ashift=12 -O atime=off -O xattr=off -O dedup=off -m /data/pool-2 \
    pool-2 raidz2 ${c[7]} ${c[8]} \
    raidz2 ${c[9]} ${c[10]} \
    raidz2 ${c[11]} ${c[12]}

zpool create -f -O compression=lz4 -O atime=off -O xattr=sa -O dedup=off -O autotrim=on -m /data/meta meta mirror sdb sdc

zpool export pool-1
zpool export pool-2

zpool import -d /dev/mapper pool-1
zpool import -d /dev/mapper pool-2
