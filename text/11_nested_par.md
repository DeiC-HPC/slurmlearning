Job parallelized with both distributed and shared memory
---

Using the tools for shared and distributed memory parallel jobs one can create jobs that combine the two approaches.
This done in the straightforward manner of adding directives for both to the Slurm script.

Please navigate to the directory `~/nested_par/cpp/` where you will find a Hello World program in C++ that implements parallelism with both distributed and shared memory through MPI and OpenMP, a Makefile and a run script for the program.
The program is written such that the standard output clearly, though artificially, shows that the program does indeed run in parallel on multiple threads for each process.

Exercises
---
1. Run the program and check that it behaves as expected.
2. Write a shell script that runs either the fortran or python program.
3. *Extra*: Redo the above exercises for the other language

  ```answer
  For Fortran:
  make_run_file() {
  cat > $1.sh <<%EOF%
  #!/bin/bash
  #SBATCH --job-name=$1
  #SBATCH --output="out.txt"
  #SBATCH --error="err.txt"
  #SBATCH --time=00:00:30
  #SBATCH --mem=150M
  #SBATCH --ntasks-per-node $2
  #SBATCH --cpus-per-task $3

  make
  srun ./main.exe
  %EOF%
  }

  name=nested_fortran
  nproc=2
  ncpus=2
  export OMP_NUM_THREADS=${ncpus}

  make_run_file ${name} ${nproc} ${ncpus}
  sbatch ${name}.sh
  ```