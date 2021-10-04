Running your own code -- old
---------------------

Running you code can be done in two different ways. There are `srun` and `sbatch`.

With `srun` the job will run interactively, which means it will run like a regular terminal program. This is not useful that often as the queue is most likely full of jobs.
The best way to run your code will be to use `sbatch` which is done using a slurm script.
A slurm script is a batch script, which can contain options preceeded by `#SBATCH` before any executable line in the script.
An example script has been added to the folder `example_code` and it looks like this:

```bash
#!/usr/bin/env bash
#SBATCH --ntasks=2
#SBATCH --output="output%j%a"

make
mpirun -np $SLURM_NTASKS ./program
```

This is an example of a simple slurm script. The first line contains a shebang (`#!`), which sets the script to be run by the bash interpreter.
The next two lines are more interesting as they are arguments to our slurm job.
The first part of the line, `#SBATCH`, denotes that it is an sbatch argument. The second part is the command. In this example we are passing two arguments.
The first one being `--ntasks=2`, which tells slurm to start two processes. This is normally done on two different nodes. However in this test setup there is only one node available and therefore both will be run on that node.
The second is `--output="output%j%a"`, which is used to send output from you script to a file. The percent signs followed by a letter are a part of the filename pattern you can read more about [here](https://slurm.schedmd.com/sbatch.html#SECTION_%3CB%3Efilename-pattern%3C/B%3E). In this case the output file `output[jobid][job array id (index)]` This is useful if your program prints anything that you want to see afterwards. Given it is run as a batch job you will not get it printed to the terminal like you would with a normal command.

Using `make` in the script, which we have done here, is not a good idea as it will be run on all allocated notes. But compiling your code on the system is a very good idea as the compilers on the machines are often fine tuned to give the best performance possible of the available hardware.
More information about available arguments can be found [here](https://slurm.schedmd.com/sbatch.html).
