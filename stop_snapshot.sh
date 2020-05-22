systemctl stop beegfs-meta@snapshot
systemctl stop beegfs-storage@snapshot
systemctl stop beegfs-mgmtd@snapshot

zfs destroy -r meta/snapshot
zfs destroy -r storage/snapshot
zfs destroy -r mgmt/snapshot
