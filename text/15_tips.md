Tips and Tricks
---

Working with Slurm some commands are used quite frequently e.g. many users find them self checking the queue for their own jobs.
With frequent use `squeue -u $USER` quickly becomes quite verbose.
If your find yourself typing a long slurm command often consider creating an alias for it.

At some point you might want to cancel a job before completion. This can be done with `scancel <jobid>`, where `<jobid>` is the jobid of the job you wish to cancel.
`scancel` also takes arguments like `-u`, `--state` and `--partition`.

One many clusters you pay for what you use.
It thus pays to be mindful of the number of cores and amount of memory one uses.
Specifically if one request 75% of a nodes memory and 50% of its compute cores, one will usually be charged for occupying 75% of the node.
Best practice is therefore to match the requested number of compute cores pr. node to the requested amount of memory pr. node.

Exercises
---
1. Create the alias `mj` (my jobs) for `squeue -u $USER` in `.bashrc`. Remember to source it afterwards.
2. What does `squeue -h -u $USER -o '%t' | uniq -c` do? Hint: use the [Slurm documentation](https://slurm.schedmd.com/sbatch.html).
3. How does one cancel a specific job in an array job? How about the entire array of jobs?
4. How does one cancel all ones pending job on partition debug?
5. Some clusters have their own scripts that optimize user workflow. Consult your cluster's documentation and/or ask an experienced colleague if this is the case for your cluster.
6. Consult the [Slurm documentation](https://slurm.schedmd.com/priority_multifactor.html) to see how the queue is generated. Which consequences of this should you as the user be aware of?