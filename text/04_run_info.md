Running your own code
---------------------

Running you code can be done in three different ways. These are `sbatch`, `srun` and `salloc`.

The best way to run your code will often be to use `sbatch` which is done using a slurm script.
`sbatch` schedules a job in the queue and runs it autonomously once Slurm starts the job.
A slurm script is a bash script, which can contain options preceeded by `#SBATCH` before any executable line in the script.

With `salloc` one places a request for interactive resources in the queue, which means it will run like a regular terminal program.
Interactive jobs are useful e.g. for data visualization jobs, where one actively works on the code.
In most cases interactive jobs are not necessary and `sbatch` should thus be used.

`srun` is a wrapper script that can do several different things.
With the argument `--pty bash` it can be used to start an interactive job.
The most common use is however as a substitute for `mpirun`.
More on that in the section on jobs with distributed memory parallel programs.

At some point you might want to cancel a job before completion. This can be done with `scancel <jobid>`, where `<jobid>` is the jobid of the job you wish to cancel.
`scancel` also takes arguments like `-u`, `--state` and `--partition`.

To become familiar with Slurm scripts, their components will be introduced layer by layer through an example.
Afterwards you will given an exercise where you are to write your own slurm script using the tools introduced to that point.
This part is organized in directories each focusing on a certain part of the script.
Most directories contain three subdirectories entitled cpp, fortran and python respectively.
The cpp subdirectory contains a C++ program, a Makefile to compile the program and an example slurm script or run file through which the feature in question is illustrated.
The fortran and python subdirectories contain programs in those languages but no slurm script or run file.
Your exercise is thus to use the concepts introduced in the C++ directory to write the slurm script or run file to run the code.

All Makefiles contain a clean recipe to remove all files generated during the job.

Please notice that it is bad practice to use a Makefile and compile the program during a job.
Doing this one wastes valuable compute time and blocks compute resources for other users.
For compiled languages the program should thus be compiled before starting a job.
In this tutorial we will however use a Makefile to compile programs during jobs because it is convenient and there are no other users on the system to be aware of.