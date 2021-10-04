#!/bin/bash
#SBATCH --job-name=array_job
#SBATCH --mem=50M
#SBATCH --time=00:00:30
#SBATCH --array=0-4%2
#SBATCH --output=job%a_out.txt
#SBATCH --error=job%a_err.txt

make
./main.exe $SLURM_ARRAY_TASK_ID 4

