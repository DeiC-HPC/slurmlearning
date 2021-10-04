#!/bin/bash
#SBATCH --job-name=run_file
#SBATCH --output="out.txt"
#SBATCH --error="err.txt"
#SBATCH --time=00:00:30
#SBATCH --mem=1M

make
./main.exe
