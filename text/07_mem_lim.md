Memory limit
---

Like the time limit the memory limit is a parameter Slurm uses to manage resources.
Ideally one should set the memory limit in the same way that the time limit is set, i.e. between 110% and 120% of the expected maximum memory consumption.

Exercises
---

Please navigate to the directory `~/limits/memory/`.

1. Submit the job.
2. The job should be killed by Slurm.
   1. Why?
   2. Fix the problem in the Slurm script.
3. Describe how to properly choose a memory limit for a job.
