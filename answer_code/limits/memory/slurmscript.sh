#!/bin/bash
#SBATCH --job-name=memory_limit
#SBATCH --output="out.txt"
#SBATCH --error="err.txt"
#SBATCH --time=00:01:00
#SBATCH --mem=30M

make
./main.exe
