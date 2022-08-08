Shared memory parallelized job
---

When running job using shared memory parallelization one needs Slurm to allocate a number of CPU cores for the job to execute the threads. This is done using the Slurm directive

```bash
#SBATCH --cpus-per-task=<number_of_cpus>
```

On HPC cluster's hyperthreading is often disabled and there is no reason to spawn more threads than the there are CPU cores available.
Using a shell script to generate the Slurm script one can easily fix the number of threads and CPU cores to the same number defined as a variable.

Please navigate to the directory `~/omp/cpp/` where you will find a Hello World program in C++ that implements shared memory parallelism through OpenMP, a Makefile and a run script for the program.
The program is written such that the standard output clearly, though artificially, shows that the program does indeed run in parallel.

Exercises
---
1. Run the program and check that it behaves as expected.
2. Write a shell script that runs either the fortran or python program.
3. *Extra*: Redo the above exercises for the other language

  ```answer
  For fortran:
  #!/usr/bin/env bash
  make_run_file() {
  cat > $1.sh <<%EOF%
  #!/bin/bash
  #SBATCH --job-name=$1
  #SBATCH --output="out.txt"
  #SBATCH --error="err.txt"
  #SBATCH --time=00:00:30
  #SBATCH --mem=50M
  #SBATCH --cpus-per-task=$2

  make
  ./main.exe
  %EOF%
  }

  name=openmp_fortran
  ncpus=2
  export OMP_NUM_THREADS=${ncpus}

  make_run_file ${name} ${ncpus}
  sbatch ${name}.sh

  For Python:
  #!/usr/bin/env bash
  make_run_file() {
  cat > $1.sh <<%EOF%
  #!/bin/bash
  #SBATCH --job-name=$1
  #SBATCH --output="out.txt"
  #SBATCH --error="err.txt"
  #SBATCH --time=00:00:30
  #SBATCH --mem=50M
  #SBATCH --cpus-per-task=$2

  python3 main.py
  %EOF%
  }

  name=par_python
  ncpus=2

  make_run_file ${name} ${ncpus}
  sbatch ${name}.sh
  ```