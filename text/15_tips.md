Tips and Tricks
---

Working with Slurm some commands are used quite frequently e.g. many users find them self checking the queue for their own jobs.
With frequent use `squeue --me` quickly becomes quite verbose.
If your find yourself typing a long slurm command often consider creating an alias for it.

One many clusters you pay for what you use.
It thus pays to be mindful of the number of cores and amount of memory one uses.
Specifically if one request 75% of a nodes memory and 50% of its compute cores, one will usually be charged for occupying 75% of the node.
Best practice is therefore to match the requested number of compute cores pr. node to the requested amount of memory pr. node.

Exercises
---
1. Create the alias `mj` (my jobs) for `squeue --me` in `~/.bashrc`. Remember to use the `source` command afterwards. `source` executes commands in your current shell and is therefore useful to use when you change you shell environment.

  ```answer
  Add:
  alias mj='squeue --me'
  to the file ~/.bashrc.
  Then run the command:
  source ~/.bashrc

  The command mj should now work
  ```
2. What does `squeue -h --me -o '%t' | uniq -c` do? Hint: use the [Slurm documentation](https://slurm.schedmd.com/squeue.html).

  ```answer
    squeue in this command has many parameters.
    -h means no headers, so it does not print a description to each row

    --me shows your own jobs
    -o '%t' defines the output format to only show the state of the jobs

    Then we pipe the output to the command uniq -c
    This will count occurences of each output

    So all in all this command outputs how many job you have in each state.
  ```
3. How does one cancel a specific job in an array job? How about the entire array of jobs?

  ```answer
    To cancel an entire job array, you do the same as with a normal job.
    You write scancel and then the job id of the array job.

    To cancel a specific job in an array job, you write scancel <jobid>_<arrayid>.
  ```
4. How does one cancel all ones pending job on partition debug?

  ```answer
    You run scancel -p <partition_name>
    On this cluster, it would be scancel -p learning
    because that is our only partition.
  ```
5. Some clusters have their own scripts that optimize user workflow. Consult your cluster's documentation and/or ask an experienced colleague if this is the case for your cluster.
6. Consult the [Slurm documentation](https://slurm.schedmd.com/priority_multifactor.html) to see how the queue is generated. Which consequences of this should you as the user be aware of?

  ```answer
    The queue has many factors to be aware of,
    though you are only able to control few.

    The partition factor is good to be aware of.
    Because running jobs on a partition with lower
    priority will most likely give you longer waiting times.

    The fair share is also important because Slurm will
    decrease priority of your jobs, if you have been
    running a lot and you are close to hitting your
    limit.
  ```