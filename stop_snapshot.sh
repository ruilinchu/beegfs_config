#!/bin/bash
set -e

mgmt_node=bee1
meta_node=bee[1-2]
storage_node=bee[1-2]

pdsh -w ${mgmt_node} << EOF
systemctl stop beegfs-mgmtd@snapshot
zfs destroy -r mgmt/snapshot
EOF

echo 
echo

pdsh -w ${meta_node} << EOF
systemctl stop beegfs-meta@snapshot
zfs destroy -r meta/snapshot
EOF

echo
echo

pdsh -w ${storage_node} << EOF
systemctl stop beegfs-storage@snapshot
zfs destroy -r data/snapshot
EOF

echo
echo
