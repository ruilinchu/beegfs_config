##put in a start up systemd service

##disable HyperThreading
for i in $(grep -H . /sys/devices/system/cpu/cpu*/topology/thread_siblings_list | sort -n -t ',' -k 2 -u | cut -d"," -f2); 
do 
  echo 0 > /sys/devices/system/cpu/cpu${i}/online;
done

#zfs tuning for storage
echo 4194304 > /sys/module/zfs/parameters/zfs_max_recordsize
echo deadline > /sys/module/zfs/parameters/zfs_vdev_scheduler
echo 1310720 > /sys/module/zfs/parameters/zfs_read_chunk_size
echo 0 > /sys/module/zfs/parameters/zfs_prefetch_disable
echo 262144 > /sys/module/zfs/parameters/zfs_vdev_aggregation_limit
