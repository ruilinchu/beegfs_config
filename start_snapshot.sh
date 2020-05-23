#!/bin/bash
set -e

mgmt_node=bee1
meta_node=bee[1-2]
storage_node=bee[1-2]

snap_name=hourly-2020-05-23-2008

pdsh -w ${mgmt_node} << EOF
zfs clone mgmt/current@zfs-auto-snap_${snap_name} mgmt/snapshot && systemctl start beegfs-mgmtd@snapshot
EOF

echo
echo

pdsh -w ${meta_node} << EOF
zfs clone meta/current@zfs-auto-snap_${snap_name} meta/snapshot && systemctl start beegfs-meta@snapshot
EOF

echo
echo

pdsh -w ${storage_node} << EOF
zfs clone data/current@zfs-auto-snap_${snap_name} data/snapshot && systemctl start beegfs-storage@snapshot
EOF

echo
echo
