#!/bin/bash
#SBATCH --job-name=nested_par
#SBATCH --output="out.txt"
#SBATCH --error="err.txt"
#SBATCH --time=00:00:30
#SBATCH --mem=150M
#SBATCH --nodes 2
#SBATCH --ntasks-per-node 2
#SBATCH --cpus-per-task 2

make
#mpirun -np 2 ./main.exe
srun ./main.exe
