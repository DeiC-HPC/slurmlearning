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
