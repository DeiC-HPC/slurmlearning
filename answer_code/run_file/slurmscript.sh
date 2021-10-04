#!/bin/bash
#SBATCH --output="out.txt"
#SBATCH --error="err.txt"
#SBATCH --time=00:00:30
#SBATCH --mem=1M

make
./main.exe
