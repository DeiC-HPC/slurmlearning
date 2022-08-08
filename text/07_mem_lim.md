Memory limit
---

The memory limit is a parameter in Slurm that is used to give you a node, which fits to your needs.
Usually a HPC installation will have nodes with varying amounts of memory, so it can handle jobs of different sizes.
There will be less nodes with a lot of memory and more nodes with a more "modest" amount, simply because of cost.

Some HPC sites also enforce hard memory limits. Which means that the memory limit is handled like the time limit.
This means that you have to make sure, that your memory parameter is correct.
On this installation, you will however not run in to this problem. Here you will always get the maximum amount of memory on the node.
If you try to use more memory that there is available, then your job will be killed by the OOM (Out Of Memory) Killer.

Estimating memory is of course not an easy task, but running smaller test cases while monitoring memory usage can give a baseline.
The baseline can the be multiplied while adding some overhead (10-20%) to give an idea of memory usage.

Exercises
---

Please navigate to the directory `~/limits/memory/`.

1. Submit the job.
2. The job should be killed by Slurm.
   1. Why?

      ```answer
      It used too much memory. It got killed by the OOM killer.
      ```
3. Describe how to properly choose a memory limit for a job.

   ```answer
   It is a case of trial and error.
   Running test programs and monitoring their usages can help.
   You can then multiply the baseline and add 10-20%.
   ```