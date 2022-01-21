Cluster information
-------------------

When you have got access to the cluster, you can use the command `sinfo` to get information.
Try running the command and you should see an output similar to this:

```plaintext
PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
learning*    up       1:00      1   idle linux0
```

This gives you information about the partitions on the system. Depending on the access you have to the cluster you might be able to run on all partitions or maybe only some of them. With the output here we see that there is one partition called `learning`, which is currently up, has a time limit of 1 minute, consists of 1 node, the state is idle, and the node name is linux0 (on larger systems this could for example be `linux[0-99]` meaning there would be 100 nodes).
If you want information about the nodes on each partition then you can add `-Nl` as an argument.

```plaintext
NODELIST   NODES PARTITION       STATE CPUS    S:C:T MEMORY TMP_DISK WEIGHT AVAIL_FE REASON
linux0         1 learning*        idle    4    1:4:1      1        0      1   (null) none
```

Here we can see that each node in the learning partition has 4 cores. S:C:T means Sockets:Cores:Threads so it denotes how many sockets there are in each server, how many cores each CPU has, and how many threads there are per core.
If you want to know about more options you can use with `sinfo` then you can use `--help` as an argument.
