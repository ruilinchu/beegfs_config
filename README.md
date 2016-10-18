
```
beeond launch node need have ssh access to nodes
all nodes needs to resolve the beeond mgmt nodes (can be any)
beeond start -n nodefile -i /tmp/beeond.tmp -d /tmp/scratch -c /scratch -f /etc/beegfs/ -p 1999 -s $(( numnodes < 16 ? numnodes : 16 ))
beeond stop -n nodefile -i /tmp/beeond.tmp -d -L -c -q

/etc/sysctl.conf:
vm.min_free_kbytes = 262144
## 1 gives higher performance, but will crash service OOM if mem is tight
vm.zone_reclaim_mode = 1

```
