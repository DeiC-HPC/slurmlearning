#!/bin/bash
#SBATCH --job-name=hello_world_fortran
#SBATCH --output="out.txt"
#SBATCH --time=00:00:30

make
./main.exe
