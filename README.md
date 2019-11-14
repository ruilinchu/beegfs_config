
```
[root@ddn01 ~]# time dcfldd if=/dev/zero of=/data/pool-1/output of=/data/pool-2/output bs=4M count=20k
20480 blocks (81920Mb) written.
20480+0 records in
20480+0 records out

real	1m10.401s
user	0m0.074s
sys	0m31.794s

2327MB/s

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

-bash-4.2$ tail slurm-216_chunk512k.out 

Max Write: 3041.26 MiB/sec (3189.00 MB/sec)
Max Read:  10389.95 MiB/sec (10894.65 MB/sec)

Summary of all tests:
Operation   Max(MiB)   Min(MiB)  Mean(MiB)     StdDev    Mean(s) Test# #Tasks tPN reps fPP reord reordoff reordrand seed segcnt blksiz xsize aggsize API RefNum
write        3041.26    2705.74    2909.91     129.37   17.63093 0 5 1 4 1 0 1 0 0 1 10737418240 2097152 53687091200 POSIX 0
read        10389.95    8575.87    9106.32     746.86    5.65738 0 5 1 4 1 0 1 0 0 1 10737418240 2097152 53687091200 POSIX 0

Finished: Wed Oct  9 13:01:17 2019

-bash-4.2$ beegfs-ctl --getentryinfo .
EntryID: 0-5D9BC186-2
Metadata node: hpc-10ke2.hpcc.usc.edu [ID: 2]
Stripe pattern details:
+ Type: RAID0
+ Chunksize: 512K
+ Number of storage targets: desired: 4
+ Storage Pool: 1 (Default)

-bash-4.2$ cat job.sl 
#!/bin/bash
#SBATCH -N 5
#SBATCH -n 5
srun --mpi=pmix_v2 ior -v -w -r -i 4 -F -t 2m -b 10g

```
