
```
[root@hpc-10ke1 ~]# dd if=/dev/zero of=/data/pool-1/output conv=fdatasync bs=384k count=1k

1024+0 records in

1024+0 records out

402653184 bytes (403 MB) copied, 1.10774 s, 363 MB/s

[root@hpc-10ke1 ~]# dd if=/dev/zero of=/data/pool-1/output conv=fdatasync bs=384k count=10k

10240+0 records in

10240+0 records out

4026531840 bytes (4.0 GB) copied, 37.7537 s, 107 MB/s

[root@hpc-10ke1 ~]# dd if=/dev/zero of=/data/pool-1/output conv=fdatasync bs=4M count=1k

1024+0 records in

1024+0 records out

4294967296 bytes (4.3 GB) copied, 8.91644 s, 482 MB/s

```
