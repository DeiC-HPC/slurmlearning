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
2. Run the script and check that it worked as intented.
3. *Extra*: Redo the above exercises for the other language
