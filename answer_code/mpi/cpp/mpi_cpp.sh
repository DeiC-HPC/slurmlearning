#!/bin/bash
#SBATCH --output="out.txt"
#SBATCH --error="err.txt"
#SBATCH --time=00:00:30
#SBATCH --mem=150M
#SBATCH --ntasks-per-node=2

make
srun ./main.exe
