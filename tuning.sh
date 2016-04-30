
#meta
echo deadline > /sys/block/sdX/queue/scheduler
echo 128 > /sys/block/sdX/queue/nr_requests

echo madvise > /sys/kernel/mm/redhat_transparent_hugepage/enabled
echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor >/dev/null

#data
echo deadline > /sys/block/sdX/queue/scheduler
echo 4096 > /sys/block/sdX/queue/nr_requests
echo 4096 > /sys/block/sdX/queue/read_ahead_kb
echo 5 > /proc/sys/vm/dirty_background_ratio
echo 10 > /proc/sys/vm/dirty_ratio
echo 50 > /proc/sys/vm/vfs_cache_pressure
echo 262144 > /proc/sys/vm/min_free_kbytes
echo madvise > /sys/kernel/mm/redhat_transparent_hugepage/enabled
echo madvise > /sys/kernel/mm/redhat_transparent_hugepage/defrag

