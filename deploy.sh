#!/bin/bash
yum install epel-release -y
yum install ansible pdsh -y


cat >> /etc/hosts <<EOF

10.125.0.61 hpc-staging01
10.125.0.62 hpc-staging02
10.125.0.63 hpc-staging03
EOF

cat > /etc/profile.d/pdsh.sh <<EOF
export PDSH_RCMD_TYPE='ssh'
export WCOLL='/etc/pdsh/machines'
EOF

mkdir -p /etc/pdsh
grep 10.125. /etc/hosts | awk '{print $2}' > /etc/pdsh/machines

ssh-keygen -t rsa
for i in `grep 10.125 /etc/hosts | awk '{print $2}'`; do
    ssh-keyscan $i;
done > ~/.ssh/known_hosts

ansible-playbook -i host ssh_key.yml --ask-pass






