Running your own code
---------------------

Running you code can be done in two different ways. There are `srun` and `sbatch`.

With `srun` the job will run interactively, which means it will run like a regular terminal program. This is not useful that often as the queue is most likely full of jobs.
The best way to run your code will be to use `sbatch` which is done using a slurm script.
A slurm script is a batch script, which can contain options preceeded by `#SBATCH` before any executable line in the script.

To become familiar with such a script its components will be introduced layer by layer through an example.
Afterwards you will given an exercise where you are to write your own slurm script using the tools introduced to that point.
This part is organized in directories each focusing on a certain part of the script.
Most directories contain three subdirectories entitles cpp, fortran and python respectively.
The cpp subdirectory contains a C++ program, a Makefile to compile the program and an example slurm script or run file through which the feature in question is illustrated.
The fortran and python subdirectories contain programs in those languages but no slurm script or run file.
Your exercise is thus to use the concepts introduced in the C++ directory to write the slurm script or run file to run the code.