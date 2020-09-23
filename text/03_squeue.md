The queue
---------

When you want to see the current job queue you can use the command `squeue`.
Running it on a system with many tasks in queue

```plaintext
JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
    4  learning slurmscr     user PD       0:00      1 (Resources)
    5  learning slurmscr     user PD       0:00      1 (Priority)
    6  learning slurmscr     user PD       0:00      1 (Priority)
    7  learning slurmscr     user PD       0:00      1 (Priority)
    2  learning slurmscr     user  R       0:08      1 linux0
    3  learning slurmscr     user  R       0:07      1 linux0
```

Here we can see that the jobs with ID 2 and 3 are running because ST (state) is R (running). The rest are pending and that can be seen by their state PD.
If you want to see your own jobs then you can add the argument `-u` and then a username, like this `squeue -u [user]` where `[user]` is swapped with your username.
It is also possible to see how the queue looks like in prioritised order. This is done by running `squeue --priority --sort=-p,i --states=PD` It will sort the list such that the next job will be on top.

If you want to see it for a specific partition then you can use `squeue --priority --sort=-p,i --states=PD -p [partition_name]` where `[partition_name]` is change with the partition name.
