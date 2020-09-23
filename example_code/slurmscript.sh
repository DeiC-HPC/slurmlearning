#!/usr/bin/env bash
#SBATCH --ntasks=2
#SBATCH --output="output%j%a"

make
mpirun -np $SLURM_NTASKS ./program