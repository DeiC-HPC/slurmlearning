#!/bin/bash
#SBATCH --job-name=time_limit
#SBATCH --output="out.txt"
#SBATCH --error="err.txt"
#SBATCH --time=00:01:00

make
./main.exe
