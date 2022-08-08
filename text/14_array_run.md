Running array jobs
---

To write job scripts for array jobs one needs variables to access the numbers that identify each job in the array.

| Variable name | Slurm name |
| ------------- | ---------- |
| Array job ID | `$SLURM_ARRAY_JOB_ID` |
| Array index | `$SLURM_ARRAY_TASK_ID` |
| Array length | `$SLURM_ARRAY_TASK_COUNT` |
| Array index min. | `$SLURM_ARRAY_TASK_MIN` |
| Array index max. | `$SLURM_ARRAY_TASK_MAX` |
| Array batch size | `$SLURM_ARRAY_TASK_STEP` |

There exist shorthands for array job ID and index which are `%A` and `%a` respectively which work in `#SBATCH` directives. One can thus use

```bash
#SBATCH --output==job%a_out.txt
```

or

```bash
#SBATCH --output==job${SLURM_ARRAY_TASK_ID}_out.txt
```

to redirect the standard output to `job<array_index>_out.txt`.

When using shell scripts one needs to remember that bash first performs a variable substitution when creating the Slurm script before Slurm can perform its variable substitution.
In that case one thus needs to remember to escape the bash substitution for Slurm variables using `\`.

Exercises
---
Please navigate to the directory `~/array_job/cpp/` where you will find a Hello World program in C++ that takes the array index and array length as input, a Makefile and a job script.

1. Add comments to the job script such that you comfortably understand the code.
2. Run the script and check that it worked as intended.
3. *Extra*: Redo the above exercises for the other language

  ```answer
  For Fortran:
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

  For Python:
  make_run_file() {
  cat > $1.sh <<%EOF%
  #!/bin/bash
  #SBATCH --job-name=$1
  #SBATCH --mem=50M
  #SBATCH --time=00:00:30
  #SBATCH --array=$2-$3%$4
  #SBATCH --output=job%a_out.txt
  #SBATCH --error=job%a_err.txt

  python3 main.py --job_num=\$SLURM_ARRAY_TASK_ID --arr_len=$3

  %EOF%
  }

  name=array_job
  job_index0=0
  arr_len=3
  max_num_con=2

  make_run_file $name $job_index0 $arr_len $max_num_con
  sbatch $name.sh
  ```