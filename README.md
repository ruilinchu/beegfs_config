
```
left enclosure:(front view)
1: 9:0:62:0
2: 9:0:4:0
3: 8:0:62:0
4: 8:0:4:0
5: 7:0:62:0

right enclosure:(front view)
6: 7:0:4:0
7: 6:0:62:0
8: 6:0:4:0
9: 10:0:62:0
10: 10:0:4:0

[6:0:4:0] MXE3400015HRB022
[6:0:62:0] MXE3400011MRB08F
[7:0:4:0] MXE3400014IRB1CC
[7:0:62:0] MXE3400014IRB1D3
[8:0:4:0] MXE3400014IRB171
[8:0:62:0] MXE3400014IRB1DC
[9:0:4:0] MXE3400014IRB1E1
[9:0:62:0] MXE3400011MRB003
[10:0:4:0] MXE3400014IRB1C2
[10:0:62:0] MXE3400011MRB020

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
