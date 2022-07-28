Time limit
---

The time limit serves two main purposes and should always be included in Slurm scripts.

1. It protects the system and the user from programs stuck in infinite loops
2. Slurm uses the time limit to manage the queue

As we will later learn one can submit jobs requiring multiple CPU cores to the queue.
If the next job in the queue requires 32 CPU cores Slurm will wait until 32 cores become available before running the job.
The time limit tells Slurm to how long the user expects a job to take and once running when the occupied resources will be available again.
Slurm uses this information to avoid idle resources whenever possible.
Say that it takes an hour for the 32 CPU cores required by the job first in the queue to become available, and that 16 cores is currently available.
Slurm will then scan the queue looking for the first job demanding 16 cores or fewer with a time limit less than an hour and run that job.
In this way unnecessarily indle resources can be avoided while still respecting the queue.

When setting time limits for jobs one should estimate how much time each job is expected to take and add a buffer to that number in order to avoid time expiring just before completion.
As a rule of thumb the time limit should be somewhere between 110% and 120% of the expected run time.
One can use benchmark tests for such estimates if those are available &mdash; otherwise it is a matter of trial and error.

Exercises
---

Please navigate to the directory `~/limits/time/`.

1. Submit the job.
2. The job should be killed by Slurm.
   1. Why?
   2. Fix the problem in the Slurm script.
3. Describe how to properly choose a time limit for a job.