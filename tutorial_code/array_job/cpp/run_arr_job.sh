#!/usr/bin/env bash
make_run_file() {
cat > $1.sh <<%EOF%
#!/bin/bash
#SBATCH --job-name=$1
#SBATCH --mem=50M
#SBATCH --time=00:00:30
#SBATCH --array=$2-$3%$4
#SBATCH --output=job%a_out.txt
#SBATCH --error=job%a_err.txt

make
./main.exe \$SLURM_ARRAY_TASK_ID $3

%EOF%
}

name=array_job
job_index0=0
arr_len=3
max_num_con=2

make_run_file $name $job_index0 $arr_len $max_num_con
sbatch $name.sh
