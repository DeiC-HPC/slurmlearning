Distributed memory parallelized job
---

When running job using distributed memory parallelization one needs Slurm to allocate a number of CPU cores for the job to execute the processes. This is done using the Slurm directive

```bash
#SBATCH --ntasks-per-node=<number_of_cpus>
```

Slurm has its own wrapper script that runs the number of processes specified by the Slurm directive, called `srun`.

Please navigate to the directory `~/mpi/cpp/` where you will find a Hello World program in C++ that implements distributed memory parallelism through MPI, a Makefile and a run script for the program.
The program is written such that the standard output clearly, though artificially, shows that the program does indeed run in parallel.

Exercises
---
1. Run the program and check that it behaves as expected.
2. Write a shell script that runs either the fortran or python program.
3. *Extra*: Redo the above exercises for the other language