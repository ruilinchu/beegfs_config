systemctl stop beegfs-mgmtd@snapshot
systemctl stop beegfs-meta@snapshot
systemctl stop beegfs-storage@snapshot

zfs destroy -r meta/snapshot
zfs destroy -r data/snapshot
zfs destroy -r mgmt/snapshot
