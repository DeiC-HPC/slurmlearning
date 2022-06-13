#!/usr/bin/env bash
make_run_file() {
cat > $1.sh <<%EOF%
#!/bin/bash
#SBATCH --job-name=$1
#SBATCH --output="out.txt"
#SBATCH --error="err.txt"
#SBATCH --time=00:00:30
#SBATCH --mem=150M
#SBATCH --ntasks-per-node=$2

srun python3 main.py
%EOF%
}

name=mpi_python
ncpus=2

make_run_file ${name} ${ncpus}
sbatch ${name}.sh
