Hello World
---------------------

Please navigate to the directory hello_world/cpp where you will fin a C++ program, a Makefile and a slurm script to run the program.

The basic structure of a slurm script is:

1. A line of code that defines the language through which the script should be interpreted.
2. A set of instructions specifying names and settings.
3. Code that upon execution runs the desired program.

Please use `cat` to print the contents of `slurmscript.sh`.
<br/>
The first line of code in the script, `#!/bin/bash/`, defines the script language to be bash.
<br/>
The command `#SBATCH` indicates that the rest of the line is an instruction to slurm.
<br/>
`--job-name=hello_world_cpp` assigns the job the name `hello_world_cpp`,
`--output` is used to specify the name of the file in which the standard output stream is placed
and `--time` defines the time slurm allocates for the program.
If a program exceeds the allocated time slurm will stop it.
The format used for here for time is `hh:mm:ss` and other acceptable time formats can be seen in the time section of the [slurm documentation](https://slurm.schedmd.com/sbatch.html).
<br/>
The error stream can, like the output stream, be directed into a file using `--error`.

Exercises
---
1. Run the slurm script using `sbatch slurmscript.sh` to submit the job to the slurm queue.
2. Write a slurm script for either the fortran or python program.
3. Redirect the error stream to a file called `err.txt` in your slurm script.
4. Run the slurm script without redirecting the output stream
   1. What is the output file called?
   2. Does the name change with subsequent runs?
5. *Extra:* Redo the above exercises for the other language