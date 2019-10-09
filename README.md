
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

[root@hpc-10ke2 ~]# dd if=/dev/zero of=/data/pool-4/output bs=2M count=20k
20480+0 records in
20480+0 records out
42949672960 bytes (43 GB) copied, 54.0489 s, 795 MB/s

-bash-4.2$ tail slurm-212.out 

Max Write: 3842.11 MiB/sec (4028.74 MB/sec)
Max Read:  5363.50 MiB/sec (5624.04 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev    Mean(s) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt blksiz xsize aggsize API RefNum
write        3842.11    3595.90    3695.92     101.02   88.72562 0 32 4 4 1 0 1 0 0 1 10737418240 8388608 343597383680 POSIX 0
read         5363.50    4710.50    5114.22     254.60   64.23726 0 32 4 4 1 0 1 0 0 1 10737418240 8388608 343597383680 POSIX 0

Finished: Tue Oct  8 16:59:51 2019
-bash-4.2$ beegfs-ctl --getentryinfo .
EntryID: 0-5D9C0429-2
Metadata node: hpc-10ke1.hpcc.usc.edu [ID: 1]
Stripe pattern details:
+ Type: RAID0
+ Chunksize: 8M
+ Number of storage targets: desired: 1
+ Storage Pool: 1 (Default)

-bash-4.2$ cat job.sl 
#!/bin/bash
#SBATCH -N 8
#SBATCH -n 32
srun --mpi=pmix_v2 ior -v -w -r -i 4 -F -t 8m -b 10g

```
