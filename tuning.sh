
#meta
echo deadline > /sys/block/sda/queue/scheduler
echo 128 > /sys/block/sda/queue/nr_requests

echo madvise > /sys/kernel/mm/redhat_transparent_hugepage/enabled
echo performance | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor >/dev/null

for i in $(seq 0 $(echo $(nproc --a) -1 | bc)); do echo performance |tee /sys/devices/system/cpu/cpu$i/cpufreq/scaling_governor >/dev/null; done

#data
echo deadline > /sys/block/sdb/queue/scheduler
echo 4096 > /sys/block/sdb/queue/nr_requests
echo 4096 > /sys/block/sdb/queue/read_ahead_kb
echo 5 > /proc/sys/vm/dirty_background_ratio
echo 10 > /proc/sys/vm/dirty_ratio
echo 50 > /proc/sys/vm/vfs_cache_pressure
echo 262144 > /proc/sys/vm/min_free_kbytes
echo always > /sys/kernel/mm/transparent_hugepage/enabled
echo always > /sys/kernel/mm/transparent_hugepage/defrag
