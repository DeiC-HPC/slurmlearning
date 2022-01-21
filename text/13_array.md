Array jobs
---

When running a so-called embarrassingly parallel job or a series of jobs only differing in program input one should use the Slurm feature called an array job.
Array jobs allows the user to queue a large number of jobs without overburdening the system with an excessive number of jobs.
Slurm, generally speaking, is better equibbed to handle a moderate number of medium to large sized jobs than a large number of small jobs.
If one does need to run a large number of small jobs, these should be structured as a moderate number of array jobs which Slurm is better equipped to handle.

To define a job as an array job one includes the directive

```bash
#SBATCH --array=<index_min>-<index_max>%<batch_size>
```

This runs the job for all integers in the interval [`<index_min>`,`<index_max>`] in batches of size `<batch_size>`.
More specifically `<batch_size>` is the maximum number of jobs allowed to run simultaneously.
Array jobs are named `<job_id>_<array_index>`, but its appearence in the queue depends on the job status.
A queue with array jobs might look something like this

```plaintext
JOBID       PARTITION   NAME        USER    ST      TIME    NODES
4           learning    slurmscr    user    PD      0:00        1
5           learning    slurmscr    user    PD      0:00        1
2_[2-4%2]   learning    array_jo    user    PD      0:00        1
2_0         learning    array_jo    user    R       0:08        1
2_1         learning    array_jo    user    R       0:08        1
3           learning    slurmscr    user    R       0:07        1
```

Here the jobs with indices 0 and 1 of the array job with jobid 2 is currently running with the rest pending.