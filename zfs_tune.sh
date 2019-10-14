#default 2 10 1 3
echo 10 > /sys/module/zfs/parameters/zfs_vdev_async_write_min_active
echo 15 > /sys/module/zfs/parameters/zfs_vdev_async_write_max_active
echo 1 > /sys/module/zfs/parameters/zfs_vdev_async_read_min_active
echo 3 > /sys/module/zfs/parameters/zfs_vdev_async_read_max_active

#default 10 10 10 10
echo 10 > /sys/module/zfs/parameters/zfs_vdev_sync_write_min_active
echo 10 > /sys/module/zfs/parameters/zfs_vdev_sync_write_max_active
echo 10 > /sys/module/zfs/parameters/zfs_vdev_sync_read_min_active
echo 10 > /sys/module/zfs/parameters/zfs_vdev_sync_read_max_active

#default 5
echo 5 > /sys/module/zfs/parameters/zfs_txg_timeout

#prefetch is critical for HDD
echo 0 > /sys/module/zfs/parameters/zfs_prefetch_disable

echo 1 > /sys/module/zfs/parameters/metaslab_debug_unload

###suggested 1-4GB
echo 2147483648 > /sys/module/zfs/parameters/zfs_dirty_data_max
#echo 4294967296 > /sys/module/zfs/parameters/zfs_dirty_data_max

echo 42949672960 > /sys/module/zfs/parameters/zfs_arc_max
echo 42949672960 > /sys/module/zfs/parameters/zfs_arc_min
echo 42949672960 > /sys/module/zfs/parameters/zfs_arc_meta_limit

echo 20 > /sys/module/zfs/parameters/zfs_vdev_async_write_active_min_dirty_percent 
echo deadline > /sys/module/zfs/parameters/zfs_vdev_scheduler

## more is not better, why beegfs use 262144
echo 655360  > /sys/module/zfs/parameters/zfs_vdev_aggregation_limit
## default 1048576 beegfs use 1310720
echo 1310720 > /sys/module/zfs/parameters/zfs_read_chunk_size

echo 5 > /proc/sys/vm/dirty_background_ratio
echo 10 > /proc/sys/vm/dirty_ratio
