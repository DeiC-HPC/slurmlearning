Hello World
---------------------

Please navigate to the directory `~/hello_world/cpp/` where you will find a C++ program, a Makefile and a Slurm script to run the program.

The basic structure of a Slurm script is:

1. A line of code that defines the language through which the script should be interpreted.
2. A set of instructions specifying names and settings.
3. Code that upon execution runs the desired program.

Open `slurmscript.sh` with your prefered editor (e.g. vim or emacs).


The first line of code in the script, `#!/bin/bash/`, defines the script language to be bash.


The command `#SBATCH` indicates that the rest of the line is an instruction to Slurm.


`--job-name=hello_world_cpp` assigns the job the name `hello_world_cpp`,
`--output` is used to specify the name of the file in which the standard output stream is placed
and `--time` defines the time Slurm allocates for the job.
If a program exceeds the allocated time Slurm will stop it.
The format used here for time is `hh:mm:ss` and other acceptable time formats can be seen in the time section of the [Slurm documentation](https://slurm.schedmd.com/sbatch.html).


The standard error stream can, like the standard output stream, be directed into a file using `--error`.

Exercises
---
1. Run the Slurm script using `sbatch slurmscript.sh` to submit the job to the Slurm queue.
2. Write a Slurm script for either the fortran or python program.
3. Redirect the error stream to a file called `err.txt` in your Slurm script.

   ```answer
   Add
   #SBATCH --error="err.txt"
   to the slurm script
   ```
4. Run the Slurm script without redirecting the output stream.
   1. What is the output file called?
   2. Does the name change with subsequent runs?

      ```answer
      Yes, it will be named slurm-<jobnumber>.out.
      ```
5. *Extra*: Redo the above exercises for the other language.

   ```answer
   For Python:
   #!/bin/bash
   #SBATCH --job-name=hello_world_python
   #SBATCH --output="out.txt"
   #SBATCH --time=00:00:30

   python3 main.py

   For Fortran:
   #!/bin/bash
   #SBATCH --job-name=hello_world_fortran
   #SBATCH --output="out.txt"
   #SBATCH --time=00:00:30

   make
   ./main.exe
   ```