zfs clone data@zfs-auto-snap_hourly-2020-05-22-2000      data/snapshot
zfs clone meta@zfs-auto-snap_hourly-2020-05-22-2000      meta/snapshot
zfs clone mgmt@zfs-auto-snap_hourly-2020-05-22-2000      mgmt/snapshot

systemctl start beegfs-mgmtd@snapshot
systemctl start beegfs-meta@snapshot
systemctl start beegfs-storage@snapshot
