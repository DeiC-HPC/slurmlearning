Multiple nodes
---

Using the Slurm directive

```bash
#SBATCH --nodes=<number_of_nodes>
```

one can distribute the processes between nodes.
A Slurm script with the lines

```bash
#SBATCH --ntasks-per-node=<number_of_cpus>
#SBATCH --nodes=<number_of_nodes>
```

thus requests `<number_of_nodes>` nodes with `<number_of_cpus>` on each for a total of `<number_of_nodes>` $\times$ `<number_of_cpus>` processes.

Please navigate to the directory `~/mult_nodes/c/` where you will find a Hello World program in C that implements parallelism with both distributed and shared memory through MPI and OpenMP, a Makefile and a run script for the program.
The program is written such that the standard output clearly, though artificially, shows that the program does indeed run in parallel on multiple threads for each process with the processes distributed to multiple nodes.

Exercises
---
1. Run the program and check that it behaves as expected.
2. Write a shell script that runs either the C++, fortran or python program. *Obs*: these programs will not print what nodes they run on.
3. *Extra*: Redo the above exercises for the other languages